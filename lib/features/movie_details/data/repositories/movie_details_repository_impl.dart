import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../failure.dart';
import '../../../main_screen/tabs/home/domain/entities/movie_entity.dart';
import '../../domain/entity/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repository.dart';
import '../data_sources/movie_details_remote_data_source.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource remoteDataSource;

  MovieDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId) async {
    try {
      final model = await remoteDataSource.getMovieDetails(movieId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovieSuggestions(int movieId) async {
    try {
      final movies = await remoteDataSource.getMovieSuggestions(movieId);
      final entities = movies.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
