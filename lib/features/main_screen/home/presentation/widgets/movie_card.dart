import 'package:flutter/material.dart';
import '../../../../../core/app_colors.dart';
import '../../domain/entities/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';


class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = width ?? (screenWidth * 0.36).clamp(120.0, 200.0);
    final cardHeight = height ?? (cardWidth * 1.45);
    final isSmallScreen = screenWidth < 360;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.darkGrey,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.4),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            children: [

              Positioned.fill(
                child: Image.network(
                  movie.posterImage,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: AppColors.darkGrey,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellow,
                          strokeWidth: 2.0,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.darkGrey,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.movie_outlined,
                            color: AppColors.yellow,
                            size: cardWidth * 0.25,
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'No Image',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),


              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6.0 : 8.0,
                    vertical: isSmallScreen ? 2.0 : 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movie.rating.toStringAsFixed(1),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: isSmallScreen ? 11.0 : 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Icon(
                        Icons.star_rounded,
                        color: AppColors.yellow,
                        size: isSmallScreen ? 13.0 : 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
