import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';

abstract class HistoryState {}
class HistoryInitial extends HistoryState{}
class HistoryLoading extends HistoryState{}
class HistoryLoaded extends HistoryState{
  final List<MovieEntity> movies;
  HistoryLoaded(this.movies);
}
class HistoryError extends HistoryState{
  final String message;
  HistoryError(this.message);
}
