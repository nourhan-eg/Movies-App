import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/wishlist_repository.dart';

@injectable
class GetWishlistUseCase {
  final WishlistRepository _repository;

  GetWishlistUseCase(this._repository);

  Future<List<MovieEntity>> call() async {
    return await _repository.getWishlist();
  }
}
