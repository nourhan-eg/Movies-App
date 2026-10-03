import 'package:movies/features/main_screen/tabs/home/data/models/movie.dart';

abstract class BrowseRemoteDataSource {

  Future<List<Movie>> getMoviesByGenre(String genre);

}
