
import '../../../home/domain/entities/movie_entity.dart';

abstract class WishlistRemoteDataSource {
  Future<List<MovieEntity>> getWishlist();
  Future<void> addToWishlist(MovieEntity movie);
  Future<void> removeFromWishlist(MovieEntity movie);
}
