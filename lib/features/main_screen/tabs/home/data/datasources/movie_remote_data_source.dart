import 'package:movies/features/main_screen/tabs/home/data/models/movie.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getMovies();
}
