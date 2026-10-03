import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/search/domain/repositories/search_repository.dart';

@injectable
class SearchMoviesUsecase {
  final SearchRepository searchRepository;
  SearchMoviesUsecase({required this.searchRepository});

  Future<List<MovieEntity>> call(String query){
    return searchRepository.searchMovies(query);
  }
}
