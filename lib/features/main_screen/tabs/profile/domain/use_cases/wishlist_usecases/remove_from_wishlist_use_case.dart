import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/wishlist_repository.dart';

@injectable
class RemoveFromWishlistUseCase {
  final WishlistRepository _repository;

  RemoveFromWishlistUseCase(this._repository);

  Future<void> call(MovieEntity movie) async {
    return await _repository.removeFromWishlist(movie);
  }
}
