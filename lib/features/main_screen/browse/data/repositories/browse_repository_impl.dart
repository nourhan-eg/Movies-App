import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';

import '../../domain/repositories/browse_repository.dart';
import '../data_sources/browse_remote_data_source.dart';

class BrowseRepositoryImpl implements BrowseRepository{
  final BrowseRemoteDataSource browseRemoteDataSource;

  BrowseRepositoryImpl(this.browseRemoteDataSource);
  @override
  Future<List<MovieEntity>> getMoviesByGenre(String genre)  async{
    try {
      var movies = await browseRemoteDataSource.getMoviesByGenre(genre);
      return movies.map((movie) => movie.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
  
}