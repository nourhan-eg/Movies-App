import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_suggestions_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieSuggestionsUseCase getMovieSuggestionsUseCase;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getMovieSuggestionsUseCase,
  }) : super(MovieDetailsInitial()) {
    on<FetchMovieDetailsEvent>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovieDetails(
    FetchMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(MovieDetailsLoading());

    final detailsResult = await getMovieDetailsUseCase(event.movieId);

    await detailsResult.fold(
      (failure) async {
        emit(MovieDetailsError(failure.message));
      },
      (details) async {
        final suggestionsResult = await getMovieSuggestionsUseCase(event.movieId);
        
        suggestionsResult.fold(
          (failure) {
            // Even if suggestions fail, still display details with empty suggestions
            emit(MovieDetailsSuccess(movieDetails: details, suggestions: []));
          },
          (suggestions) {
            emit(MovieDetailsSuccess(movieDetails: details, suggestions: suggestions));
          },
        );
      },
    );
  }
}
