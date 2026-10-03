import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/main_screen/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:movies/features/main_screen/profile/data/models/user_profile_model.dart';
import 'package:movies/features/main_screen/profile/domain/entities/user_profile_entity.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  ProfileRemoteDataSourceImpl({required this.firebaseAuth});

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
    return UserProfileModel.fromFirebaseUser(updatedUser);
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
}
