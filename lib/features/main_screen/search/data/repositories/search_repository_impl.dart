import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/search/data/data_sources/search_movies_data_source.dart';
import 'package:movies/features/main_screen/search/domain/repositories/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository{
  SearchMoviesDataSource searchMoviesDataSource;
  SearchRepositoryImpl({required this.searchMoviesDataSource});
  @override
  Future<List<MovieEntity>> searchMovies(String query) async{
    try {
      var movies = await searchMoviesDataSource.searchMovies(query);
      return movies.map((movie) => movie.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}