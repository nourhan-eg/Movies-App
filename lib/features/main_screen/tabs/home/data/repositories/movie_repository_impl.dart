import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/home/domain/repositories/movie_repository.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getMovies() async {
    final movies = await remoteDataSource.getMovies();
    return movies.map((movie) => movie.toEntity()).toList();
  }
}
