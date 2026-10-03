
import '../../../home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    required super.posterImage,
    required super.rating,
    required super.genres,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'posterImage': posterImage,
      'rating': rating,
      'genres': genres,
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      posterImage: json['posterImage'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      genres: (json['genres'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  factory MovieModel.fromEntity(MovieEntity movie) {
    return MovieModel(
      id: movie.id,
      title: movie.title,
      posterImage: movie.posterImage,
      rating: movie.rating,
      genres: movie.genres,
    );
  }
}
