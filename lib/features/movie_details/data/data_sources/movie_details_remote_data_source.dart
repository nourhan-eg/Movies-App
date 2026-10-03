import '../../../main_screen/tabs/home/data/models/movie.dart';
import '../models/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<Movie>> getMovieSuggestions(int movieId);
}
