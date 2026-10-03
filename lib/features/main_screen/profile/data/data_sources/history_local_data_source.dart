import 'package:movies/features/main_screen/home/domain/entities/movie_entity.dart';

abstract class HistoryLocalDataSource {
  Future<List<MovieEntity>> getHistory();
  Future<void> addToHistory(MovieEntity movie);
  Future<void> removeFromHistory(MovieEntity movie);
  Future<void> clearHistory();
}
