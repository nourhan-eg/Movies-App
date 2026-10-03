import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../failure.dart';
import '../entity/movie_details_entity.dart';
import '../repositories/movie_details_repository.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieDetailsRepository repository;

  GetMovieDetailsUseCase(this.repository);

  Future<Either<Failure, MovieDetailsEntity>> call(int movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
