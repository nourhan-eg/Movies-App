import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../failure.dart';
import '../../../main_screen/tabs/home/domain/entities/movie_entity.dart';
import '../repositories/movie_details_repository.dart';

@injectable
class GetMovieSuggestionsUseCase {
  final MovieDetailsRepository repository;

  GetMovieSuggestionsUseCase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call(int movieId) async {
    return await repository.getMovieSuggestions(movieId);
  }
}
