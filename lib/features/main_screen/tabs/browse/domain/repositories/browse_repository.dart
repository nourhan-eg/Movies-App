import '../../../home/domain/entities/movie_entity.dart';

abstract class BrowseRepository {
  Future<List<MovieEntity>> getMoviesByGenre(String genre);
}