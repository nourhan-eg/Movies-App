import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/history_repository.dart';

@injectable
class GetHistoryUseCase {
  final HistoryRepository _repository;

  GetHistoryUseCase(this._repository);

  Future<List<MovieEntity>> call() async {
    return await _repository.getHistory();
  }
}
