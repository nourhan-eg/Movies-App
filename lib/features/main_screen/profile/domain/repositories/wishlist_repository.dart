import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';

abstract class WishlistRepository {
  Future<List<MovieEntity>> getWishlist();
  Future<void> addToWishlist(MovieEntity movie);
  Future<void> removeFromWishlist(MovieEntity movie);
}
