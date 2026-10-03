import 'package:movies/features/main_screen/tabs/home/domain/entities/movie_entity.dart';

abstract class BrowseStates {}

class BrowseInitial extends BrowseStates {}

class BrowseLoading extends BrowseStates {}

class BrowseLoaded extends BrowseStates {
  final List<MovieEntity> movies;

  BrowseLoaded({required this.movies});
}

class BrowseFailure extends BrowseStates {
  final String message;

  BrowseFailure({required this.message});
}
