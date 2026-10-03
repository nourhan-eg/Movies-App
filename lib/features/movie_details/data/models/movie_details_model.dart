import '../../domain/entity/movie_details_entity.dart';
import 'cast_model.dart';

class MovieDetailsModel {
  final int? id;
  final String? title;
  final int? year;
  final double? rating;
  final int? runtime;
  final int? likeCount;
  final String? descriptionFull;
  final String? summary;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? ytTrailerCode;
  final List<String>? genres;
  final String? mediumScreenshotImage1;
  final String? mediumScreenshotImage2;
  final String? mediumScreenshotImage3;
  final List<CastModel>? cast;

  MovieDetailsModel({
    this.id,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.likeCount,
    this.descriptionFull,
    this.summary,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.ytTrailerCode,
    this.genres,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.cast,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    List<CastModel> castList = [];
    if (json['cast'] != null) {
      json['cast'].forEach((v) {
        castList.add(CastModel.fromJson(v));
      });
    }

    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: json['runtime'],
      likeCount: json['like_count'],
      descriptionFull: json['description_full'],
      summary: json['summary'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],
      backgroundImage: json['background_image'],
      backgroundImageOriginal: json['background_image_original'],
      ytTrailerCode: json['yt_trailer_code'],
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
      mediumScreenshotImage1: json['medium_screenshot_image1'],
      mediumScreenshotImage2: json['medium_screenshot_image2'],
      mediumScreenshotImage3: json['medium_screenshot_image3'],
      cast: castList,
    );
  }

  MovieDetailsEntity toEntity() {
    final List<String> screenshotsList = [];
    if (mediumScreenshotImage1 != null && mediumScreenshotImage1!.isNotEmpty) {
      screenshotsList.add(mediumScreenshotImage1!);
    }
    if (mediumScreenshotImage2 != null && mediumScreenshotImage2!.isNotEmpty) {
      screenshotsList.add(mediumScreenshotImage2!);
    }
    if (mediumScreenshotImage3 != null && mediumScreenshotImage3!.isNotEmpty) {
      screenshotsList.add(mediumScreenshotImage3!);
    }

    return MovieDetailsEntity(
      id: id ?? 0,
      title: title ?? '',
      year: year ?? 0,
      rating: rating ?? 0.0,
      runtime: runtime ?? 0,
      likeCount: likeCount ?? 0,
      summary: (descriptionFull != null && descriptionFull!.isNotEmpty)
          ? descriptionFull!
          : (summary ?? ''),
      posterImage: largeCoverImage ?? mediumCoverImage ?? '',
      backgroundImage: backgroundImageOriginal ?? backgroundImage ?? '',
      ytTrailerCode: ytTrailerCode,
      genres: genres ?? [],
      screenshots: screenshotsList,
      cast: cast?.map((c) => c.toEntity()).toList() ?? [],
    );
  }
}
