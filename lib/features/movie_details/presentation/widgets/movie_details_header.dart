import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/text_styles.dart';

class MovieDetailsHeader extends StatelessWidget {
  final String posterImage;
  final String backgroundImage;
  final String title;
  final int year;
  final VoidCallback? onWatchPressed;
  final VoidCallback? onPlayPressed;
  final VoidCallback? onBookmarkPressed;
  final bool isBookmarked;

  const MovieDetailsHeader({
    super.key,
    required this.posterImage,
    required this.backgroundImage,
    required this.title,
    required this.year,
    this.onWatchPressed,
    this.onPlayPressed,
    this.onBookmarkPressed,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    final imageSrc = posterImage.isNotEmpty ? posterImage : backgroundImage;

    return Column(
      children: [
        Stack(
          children: [
            // Hero Poster Image with Overlay Gradient
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Container(
                height: 480,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.darkGrey,
                ),
                child: imageSrc.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageSrc,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.movie_outlined,
                          size: 80,
                          color: AppColors.white,
                        ),
                      )
                    : const Icon(
                        Icons.movie_outlined,
                        size: 80,
                        color: AppColors.white,
                      ),
              ),
            ),
            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.4),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.85),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            // Top Navigation Row
            Positioned(
              top: 44,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white,
                      size: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: onBookmarkPressed,
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: AppColors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
            // Center Play Button
            Positioned(
              top: 190,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: onPlayPressed,
                  child: Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.yellow.withValues(alpha: 0.5),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: AppColors.dark,
                      size: 44,
                    ),
                  ),
                ),
              ),
            ),
            // Movie Title & Release Year Overlay
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.title2(AppColors.white).copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$year',
                    style: TextStyles.textSmall(Colors.white70).copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Watch Red Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onWatchPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                'Watch',
                style: TextStyles.headingSmall(AppColors.white).copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
