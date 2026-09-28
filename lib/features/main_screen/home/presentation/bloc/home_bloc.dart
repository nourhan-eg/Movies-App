import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../domain/use_cases/get_movies_use_case.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMoviesUseCase getMoviesUseCase;

  HomeBloc(this.getMoviesUseCase) : super(HomeInitial()) {
    on<FetchMoviesEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final movies = await getMoviesUseCase();
        emit(HomeLoaded(movies));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}