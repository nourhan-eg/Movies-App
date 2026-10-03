import '../../../../home/domain/entities/movie_entity.dart';

abstract class WishlistEvent {}
class LoadWishlist extends WishlistEvent {}
class AddToWishlistRequest extends WishlistEvent{
  final MovieEntity movie;
  AddToWishlistRequest(this.movie);
}
class RemoveFromWishlistRequest extends WishlistEvent{
  final MovieEntity movie;
  RemoveFromWishlistRequest(this.movie);
}
