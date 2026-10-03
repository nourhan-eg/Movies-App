import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<MovieEntity> movies;

  SearchSuccessState(this.movies);
}

class SearchErrorState extends SearchStates {
  final String message;

  SearchErrorState(this.message);
}
