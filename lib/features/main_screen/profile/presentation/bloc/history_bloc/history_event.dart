import '../../../../home/domain/entities/movie_entity.dart';

abstract class HistoryEvent {}
class LoadHistory extends HistoryEvent{

}
class AddToHistoryRequest extends HistoryEvent{
  final MovieEntity movie;
  AddToHistoryRequest(this.movie);
}
class RemoveFromHistoryRequest extends HistoryEvent{
  final MovieEntity movie;
  RemoveFromHistoryRequest(this.movie);
}
class ClearHistoryRequest extends HistoryEvent{}

