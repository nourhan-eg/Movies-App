import '../../../home/data/models/movie.dart';

abstract class SearchMoviesDataSource {
  Future<List<Movie>>searchMovies(String query);

}