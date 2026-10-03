import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
}
