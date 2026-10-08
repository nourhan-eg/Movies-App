import 'package:flutter/material.dart';
import 'package:movies/core/app_texts.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/text_styles.dart';

class MovieSummarySection extends StatelessWidget {
  final String summary;

  const MovieSummarySection({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    if (summary.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.summary,
            style: TextStyles.title2(AppColors.white).copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            summary,
            style: TextStyles.textSmall(Colors.white70).copyWith(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
