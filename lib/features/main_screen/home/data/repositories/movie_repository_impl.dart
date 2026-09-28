import 'package:movies/features/main_screen/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/home/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository{
  MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<List<MovieEntity>> getMovies() async{
    try{

      var movies = await movieRemoteDataSource.getMovies();
      return movies.map((movie) => movie.toEntity()).toList();


    }
    catch(e){
      rethrow;
    }
  }
  }

