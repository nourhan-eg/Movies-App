abstract class BrowseEvents {}

class GetMoviesByGenreRequested extends BrowseEvents {
  final String genre;

  GetMoviesByGenreRequested({required this.genre});
}