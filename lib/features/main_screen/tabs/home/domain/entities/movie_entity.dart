class MovieEntity {
  final int id;
  final String title;
  final String posterImage;
  final double rating;
  final List<String> genres;

  MovieEntity({
    required this.id,
    required this.title,
    required this.posterImage,
    required this.rating,
    required this.genres,
  });
}