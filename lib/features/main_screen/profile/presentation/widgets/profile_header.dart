import 'package:flutter/material.dart';
import '../../../../../core/app_colors.dart';
import '../../../../../core/text_styles.dart';
import '../../../../../core/widgets/app_avatars.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String avatarPath;
  final int wishListCount;
  final int historyCount;
  final VoidCallback onEditProfile;
  final VoidCallback onExit;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.avatarPath,
    required this.wishListCount,
    required this.historyCount,
    required this.onEditProfile,
    required this.onExit,
  });

  Widget _buildAvatarImage(String path) {
    if (path.isEmpty) {
      return Image.asset(AppAvatars.beardMan, fit: BoxFit.cover);
    }
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return Image.network(
        path,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(AppAvatars.beardMan, fit: BoxFit.cover);
        },
      );
    }
    return Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(AppAvatars.beardMan, fit: BoxFit.cover);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarSize = (screenWidth * 0.22).clamp(72.0, 100.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.yellow,
                    width: 2.5,
                  ),
                ),
                child: ClipOval(
                  child: _buildAvatarImage(avatarPath),
                ),
              ),
              const SizedBox(width: 20),
              // Stats
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(count: wishListCount, label: 'Wish List'),
                    _StatItem(count: historyCount, label: 'History'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Name
          Text(
            name,
            style: TextStyles.headingSmall(AppColors.white),
          ),
          const SizedBox(height: 16),
          // Buttons row
          Row(
            children: [
              Expanded(
                child: _ProfileActionButton(
                  text: 'Edit Profile',
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.dark,
                  onPressed: onEditProfile,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ProfileActionButton(
                  text: 'Exit',
                  backgroundColor: AppColors.red,
                  textColor: AppColors.white,
                  onPressed: onExit,
                  trailingIcon: Icons.logout_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final int count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyles.heading2(AppColors.white),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyles.textSmall(AppColors.white),
        ),
      ],
    );
  }
}

class _ProfileActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final IconData? trailingIcon;

  const _ProfileActionButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.headingSmall(textColor),
            ),
            if (trailingIcon != null) ...[
              const SizedBox(width: 6),
              Icon(trailingIcon, color: textColor, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
