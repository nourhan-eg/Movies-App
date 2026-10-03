import '../../../main_screen/tabs/home/domain/entities/movie_entity.dart';
import '../../domain/entity/movie_details_entity.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;
  final List<MovieEntity> suggestions;

  MovieDetailsSuccess({
    required this.movieDetails,
    required this.suggestions,
  });
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
