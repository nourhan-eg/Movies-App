import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/text_styles.dart';

class MovieScreenshotsSection extends StatelessWidget {
  final List<String> screenshots;

  const MovieScreenshotsSection({
    super.key,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    if (screenshots.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Screen Shots',
            style: TextStyles.title2(AppColors.white).copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: screenshots.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: screenshots[index],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 180,
                    color: AppColors.darkGrey,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.yellow,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 180,
                    color: AppColors.darkGrey,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: AppColors.white,
                    ),
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
