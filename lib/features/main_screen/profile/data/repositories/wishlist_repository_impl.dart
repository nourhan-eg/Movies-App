import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/profile/data/data_sources/wishlist_remote_data_source.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/wishlist_repository.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource remoteDataSource;

  WishlistRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MovieEntity>> getWishlist() {
    return remoteDataSource.getWishlist();
  }

  @override
  Future<void> addToWishlist(MovieEntity movie) {
    return remoteDataSource.addToWishlist(movie);
  }

  @override
  Future<void> removeFromWishlist(MovieEntity movie) {
    return remoteDataSource.removeFromWishlist(movie);
  }
}
