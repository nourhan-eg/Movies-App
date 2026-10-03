import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/history_repository.dart';

@injectable
class GetHistoryUseCase {
  final HistoryRepository _repository;

  GetHistoryUseCase(this._repository);

  Future<List<MovieEntity>> call() async {
    return await _repository.getHistory();
  }
}
