import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/data/data_sources/history_local_data_source.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/history_repository.dart';

@Injectable(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDataSource localDataSource;

  HistoryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<MovieEntity>> getHistory() {
    return localDataSource.getHistory();
  }

  @override
  Future<void> addToHistory(MovieEntity movie) {
    return localDataSource.addToHistory(movie);
  }

  @override
  Future<void> removeFromHistory(MovieEntity movie) {
    return localDataSource.removeFromHistory(movie);
  }

  @override
  Future<void> clearHistory() {
    return localDataSource.clearHistory();
  }
}
