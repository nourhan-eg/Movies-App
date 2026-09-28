import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/home/domain/repositories/movie_repository.dart';

class GetMoviesUseCase {
  MovieRepository movieRepository;
  GetMoviesUseCase(this.movieRepository);

Future<List<MovieEntity>> call(){
  return movieRepository.getMovies();
}
}


