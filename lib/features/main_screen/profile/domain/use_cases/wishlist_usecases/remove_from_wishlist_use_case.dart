import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/wishlist_repository.dart';

@injectable
class RemoveToWishlistUseCase {
  final WishlistRepository _repository;

  RemoveToWishlistUseCase(this._repository);

  Future<void> call(MovieEntity movie) async {
    return await _repository.removeFromWishlist(movie);
  }
}
