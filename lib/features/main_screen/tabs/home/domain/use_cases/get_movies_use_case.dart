import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/home/domain/repositories/movie_repository.dart';

@injectable
class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getMovies();
  }
}
