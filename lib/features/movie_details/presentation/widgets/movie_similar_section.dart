import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/text_styles.dart';
import '../../../main_screen/tabs/home/domain/entities/movie_entity.dart';

class MovieSimilarSection extends StatelessWidget {
  final List<MovieEntity> movies;
  final Function(int movieId)? onMovieTap;

  const MovieSimilarSection({
    super.key,
    required this.movies,
    this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar',
            style: TextStyles.title2(AppColors.white).copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  if (onMovieTap != null) {
                    onMovieTap!(movie.id);
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: movie.posterImage,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.darkGrey,
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.darkGrey,
                            child: const Icon(
                              Icons.movie,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      // Rating Pill on Top Left
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                movie.rating.toStringAsFixed(1),
                                style: TextStyles.headingSmall(AppColors.white)
                                    .copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.star_rounded,
                                color: AppColors.yellow,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
