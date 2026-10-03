
import '../../../home/domain/entities/movie_entity.dart';

abstract class HistoryRepository {
  Future<List<MovieEntity>> getHistory();
  Future<void> addToHistory(MovieEntity movie);
  Future<void> removeFromHistory(MovieEntity movie);
  Future<void> clearHistory();
}
