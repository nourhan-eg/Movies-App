import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/history_repository.dart';

@injectable
class AddToHistoryUseCase {
  final HistoryRepository _repository;

  AddToHistoryUseCase(this._repository);

  Future<void> call(MovieEntity movie) async {
    return await _repository.addToHistory(movie);
  }
}
