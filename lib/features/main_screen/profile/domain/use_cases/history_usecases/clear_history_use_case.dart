import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/history_repository.dart';

@injectable
class ClearHistoryUseCase {
  final HistoryRepository _repository;

  ClearHistoryUseCase(this._repository);

  Future<void> call() async {
    return await _repository.clearHistory();
  }
}
