import 'package:dartz/dartz.dart';
import '../../../../failure.dart';
import '../../../main_screen/tabs/home/domain/entities/movie_entity.dart';
import '../entity/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);
  Future<Either<Failure, List<MovieEntity>>> getMovieSuggestions(int movieId);
}
