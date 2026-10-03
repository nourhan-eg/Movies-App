import 'package:movies/features/main_screen/home/data/models/movie.dart';

abstract class BrowseRemoteDataSource {

  Future<List<Movie>> getMoviesByGenre(String genre);

}