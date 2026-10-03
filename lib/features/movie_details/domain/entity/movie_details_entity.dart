import 'cast_entity.dart';

class MovieDetailsEntity {
  final int id;
  final String title;
  final int year;
  final double rating;
  final int runtime;
  final int likeCount;
  final String summary;
  final String posterImage;
  final String backgroundImage;
  final String? ytTrailerCode;
  final List<String> genres;
  final List<String> screenshots;
  final List<CastEntity> cast;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.likeCount,
    required this.summary,
    required this.posterImage,
    required this.backgroundImage,
    this.ytTrailerCode,
    required this.genres,
    required this.screenshots,
    required this.cast,
  });
}
