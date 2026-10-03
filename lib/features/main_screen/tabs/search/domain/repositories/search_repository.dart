import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';

abstract class SearchRepository {
  Future<List<MovieEntity>> searchMovies(String query);
}
