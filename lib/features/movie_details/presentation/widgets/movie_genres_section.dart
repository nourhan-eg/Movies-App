import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/text_styles.dart';

class MovieGenresSection extends StatelessWidget {
  final List<String> genres;

  const MovieGenresSection({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genres',
            style: TextStyles.title2(AppColors.white).copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: genres.map((genre) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  genre,
                  style: TextStyles.textSmall(AppColors.white).copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
