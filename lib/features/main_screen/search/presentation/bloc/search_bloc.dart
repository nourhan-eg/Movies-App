import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/search/domain/usecases/search_movies_usecase.dart';
import 'package:movies/features/main_screen/search/presentation/bloc/search_events.dart';
import 'package:movies/features/main_screen/search/presentation/bloc/search_states.dart';

@injectable
class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  final SearchMoviesUsecase searchMoviesUseCase;

  SearchBloc(this.searchMoviesUseCase) : super(SearchInitialState()) {
    on<SearchMoviesRequested>(_onSearchMovies);
  }

  Future<void> _onSearchMovies(
      SearchMoviesRequested event,
      Emitter<SearchStates> emit,
      ) async {
    if (event.query.trim().isEmpty) {
      emit(SearchInitialState());
      return;
    }

    emit(SearchLoadingState());

    try {
      final movies = await searchMoviesUseCase(event.query);
      emit(SearchSuccessState(movies));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}