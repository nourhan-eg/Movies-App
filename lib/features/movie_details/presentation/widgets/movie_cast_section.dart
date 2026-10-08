import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/app_texts.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/text_styles.dart';
import '../../domain/entity/cast_entity.dart';

class MovieCastSection extends StatelessWidget {
  final List<CastEntity> cast;

  const MovieCastSection({
    super.key,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.cast,
            style: TextStyles.title2(AppColors.white).copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cast.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final member = cast[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: member.avatarUrl != null && member.avatarUrl!.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: member.avatarUrl!,
                              width: 54,
                              height: 54,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Container(
                                width: 54,
                                height: 54,
                                color: Colors.grey.shade800,
                                child: const Icon(Icons.person, color: AppColors.white),
                              ),
                            )
                          : Container(
                              width: 54,
                              height: 54,
                              color: Colors.grey.shade800,
                              child: const Icon(Icons.person, color: AppColors.white),
                            ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppTexts.name} : ${member.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.headingSmall(AppColors.white).copyWith(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${AppTexts.character} : ${member.characterName}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.textSmall(Colors.white70).copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
