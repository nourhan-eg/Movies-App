import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/text_styles.dart';

class MovieStatsBar extends StatelessWidget {
  final int likeCount;
  final int runtime;
  final double rating;

  const MovieStatsBar({
    super.key,
    required this.likeCount,
    required this.runtime,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatPill(
            icon: Icons.favorite,
            iconColor: AppColors.yellow,
            label: '$likeCount',
          ),
          _buildStatPill(
            icon: Icons.access_time_filled,
            iconColor: AppColors.yellow,
            label: '$runtime',
          ),
          _buildStatPill(
            icon: Icons.star_rounded,
            iconColor: AppColors.yellow,
            label: rating.toStringAsFixed(1),
          ),
        ],
      ),
    );
  }

  Widget _buildStatPill({
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyles.headingSmall(AppColors.white).copyWith(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
