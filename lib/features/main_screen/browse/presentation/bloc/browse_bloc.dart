import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_movies_by_genre_usecase.dart';
import 'browse_events.dart';
import 'browse_states.dart';

class BrowseBloc extends Bloc<BrowseEvents, BrowseStates> {
  final GetMoviesByGenreUsecase getMoviesByGenreUsecase;

  BrowseBloc({required this.getMoviesByGenreUsecase}) : super(BrowseInitial()) {
    on<GetMoviesByGenreRequested>(_onGetMoviesByGenreRequested);
  }

  Future<void> _onGetMoviesByGenreRequested(
      GetMoviesByGenreRequested event,
      Emitter<BrowseStates> emit,
      ) async {
    emit(BrowseLoading());
    try {
      final movies = await getMoviesByGenreUsecase(event.genre);
      emit(BrowseLoaded(movies: movies));
    } catch (e) {
      emit(BrowseFailure(message: 'Something went wrong, please try again'));
    }
  }
}