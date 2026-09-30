import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/wishlist_repository.dart';

@injectable
class AddToWishlistUseCase {
  final WishlistRepository _repository;

  AddToWishlistUseCase(this._repository);

  Future<void> call(MovieEntity movie) async {
    return await _repository.addToWishlist(movie);
  }
}
