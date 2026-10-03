import 'package:injectable/injectable.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repositories/browse_repository.dart';

@injectable
class GetMoviesByGenreUsecase {
  final BrowseRepository browseRepository;

  GetMoviesByGenreUsecase(this.browseRepository);

  Future<List<MovieEntity>> call(String genre) {
    return browseRepository.getMoviesByGenre(genre);
  }
}