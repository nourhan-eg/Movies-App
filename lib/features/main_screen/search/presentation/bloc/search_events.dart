abstract class SearchEvents {}

class SearchMoviesRequested extends SearchEvents {
  final String query;

  SearchMoviesRequested({required this.query});
}