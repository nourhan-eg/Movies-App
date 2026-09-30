import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/profile/data/data_sources/wishlist_remote_data_source.dart';
import 'package:movies/features/main_screen/profile/data/models/wishlist_movie_model.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  WishlistRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  CollectionReference<Map<String, dynamic>> _wishlistCollection() {
    final uid = firebaseAuth.currentUser?.uid;
    if (uid == null) throw ServerFailure('No user is logged in');
    return firestore.collection('users').doc(uid).collection('wishlist');
  }

  @override
  Future<List<MovieEntity>> getWishlist() async {
    try {
      final snapshot = await _wishlistCollection()
          .orderBy('addedAt', descending: true)
          .get();
      return snapshot.docs
          .map((doc) => WishlistMovieModel.fromJson(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw ServerFailure(e.message ?? 'Failed to load wishlist');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> addToWishlist(MovieEntity movie) async {
    try {
      final json = WishlistMovieModel.fromEntity(movie).toJson()
        ..['addedAt'] = FieldValue.serverTimestamp();
      await _wishlistCollection().doc(movie.id.toString()).set(json);
    } on FirebaseException catch (e) {
      throw ServerFailure(e.message ?? 'Failed to add to wishlist');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> removeFromWishlist(MovieEntity movie) async {
    try {
      await _wishlistCollection().doc(movie.id.toString()).delete();
    } on FirebaseException catch (e) {
      throw ServerFailure(e.message ?? 'Failed to remove from wishlist');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
