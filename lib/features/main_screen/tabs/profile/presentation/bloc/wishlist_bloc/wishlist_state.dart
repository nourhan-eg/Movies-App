import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';

abstract class WishlistState {}
class WishlistInitial extends WishlistState{}
class WishlistLoading extends WishlistState{}
class WishlistLoaded extends WishlistState{
  final List<MovieEntity> movies;
  WishlistLoaded(this.movies);
}
class WishlistError extends WishlistState{
  final String message;
  WishlistError(this.message);
}
