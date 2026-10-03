import 'package:movies/features/main_screen/tabs/profile/data/models/movie_model.dart';

import '../../../home/domain/entities/movie_entity.dart';

class HistoryMovieModel extends MovieModel {
  final int viewedAt;

  HistoryMovieModel({
    required super.id,
    required super.title,
    required super.posterImage,
    required super.rating,
    required super.genres,
    required this.viewedAt,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'viewedAt': viewedAt,
    };
  }

  factory HistoryMovieModel.fromJson(Map<String, dynamic> json) {
    final base = MovieModel.fromJson(json);
    return HistoryMovieModel(
      id: base.id,
      title: base.title,
      posterImage: base.posterImage,
      rating: base.rating,
      genres: base.genres,
      viewedAt: (json['viewedAt'] as num?)?.toInt() ?? 0,
    );
  }

  factory HistoryMovieModel.fromEntity(MovieEntity movie) {
    final base = MovieModel.fromEntity(movie);
    return HistoryMovieModel(
      id: base.id,
      title: base.title,
      posterImage: base.posterImage,
      rating: base.rating,
      genres: base.genres,
      viewedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
