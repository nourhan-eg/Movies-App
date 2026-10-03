import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/main_screen/tabs/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:movies/features/main_screen/tabs/profile/data/models/user_profile_model.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/entities/user_profile_entity.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  ProfileRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserProfileEntity> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw ServerFailure('No user is logged in');
    }
    try {
      await user.reload();
    } catch (_) {
      // Ignore network errors on reload and use current user instance
    }
    final updatedUser = firebaseAuth.currentUser ?? user;

    String? avatar;
    String? phone;
    try {
      final doc =
          await firestore.collection('users').doc(updatedUser.uid).get();
      if (doc.exists && doc.data() != null) {
        final data = doc.data()!;
        if (data.containsKey('avatar') && data['avatar'] != null) {
          avatar = data['avatar'] as String?;
        }
        if (data.containsKey('phone') && data['phone'] != null) {
          phone = data['phone'] as String?;
        }
      }
    } catch (_) {
      // Ignore Firestore read errors
    }

    final resolvedAvatar =
        (avatar != null && avatar.isNotEmpty) ? avatar : updatedUser.photoURL;

    return UserProfileModel(
      uid: updatedUser.uid,
      name: updatedUser.displayName ?? 'User',
      email: updatedUser.email ?? '',
      photoUrl: resolvedAvatar,
      phone: phone,
    );
  }

  @override
  Future<void> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(e.message ?? 'Sign out failed');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> updateProfile({
    required String name,
    required String phone,
    required String avatar,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw ServerFailure('No user is logged in');
    try {
      await user.updateDisplayName(name);
      await user.updatePhotoURL(avatar);
      await firestore.collection('users').doc(user.uid).set(
        {'avatar': avatar, 'phone': phone},
        SetOptions(merge: true),
      );
      await user.reload();
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(e.message ?? 'Failed to update profile');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> deleteAccount() async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw ServerFailure('No user is logged in');
    final uid = user.uid;
    try {
      final wishlistSnap = await firestore
          .collection('users')
          .doc(uid)
          .collection('wishlist')
          .get();
      for (final doc in wishlistSnap.docs) {
        await doc.reference.delete();
      }
      await firestore.collection('users').doc(uid).delete();
      final boxName = 'history_$uid';
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box(boxName).close();
      }
      await Hive.deleteBoxFromDisk(boxName);
      await user.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw ServerFailure(
          'Please log in again, then retry deleting your account',
        );
      }
      throw ServerFailure(e.message ?? 'Failed to delete account');
    } catch (e) {
      if (e is ServerFailure) rethrow;
      throw ServerFailure(e.toString());
    }
  }
}
