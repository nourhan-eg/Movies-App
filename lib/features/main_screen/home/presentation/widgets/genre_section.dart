import 'package:flutter/material.dart';
import '../../../../../core/app_colors.dart';
import '../../domain/entities/movie_entity.dart';
import '../../../../../core/widgets/movie_card.dart';


class GenreSection extends StatelessWidget {
  final String genre;
  final List<MovieEntity> movies;
  final ValueChanged<MovieEntity>? onMovieTap;
  final VoidCallback? onSeeMoreTap;

  const GenreSection({
    super.key,
    required this.genre,
    required this.movies,
    this.onMovieTap,
    this.onSeeMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth * 0.36).clamp(130.0, 180.0);
    final cardHeight = cardWidth * 1.45;
    final listHeight = cardHeight + 10.0;

    final titleFontSize = (screenWidth * 0.048).clamp(18.0, 24.0);
    final seeMoreFontSize = (screenWidth * 0.035).clamp(13.0, 16.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                genre,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              InkWell(
                onTap: onSeeMoreTap,
                borderRadius: BorderRadius.circular(4.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                  child: Row(
                    children: [
                      Text(
                        'See More',
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: seeMoreFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.yellow,
                        size: seeMoreFontSize + 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


        SizedBox(
          height: listHeight,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12.0),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(
                movie: movie,
                width: cardWidth,
                height: cardHeight,
                onTap: () => onMovieTap?.call(movie),
              );
            },
          ),
        ),
      ],
    );
  }
}
