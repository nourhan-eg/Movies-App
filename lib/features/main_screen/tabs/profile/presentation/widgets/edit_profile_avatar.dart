import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/widgets/app_avatars.dart';

class EditProfileAvatar extends StatelessWidget {
  final String avatarPath;
  final VoidCallback onTap;

  const EditProfileAvatar({
    super.key,
    required this.avatarPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.yellow, width: 3),
        ),
        child: ClipOval(
          child: Image.asset(
            AppAvatars.resolve(avatarPath),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset(AppAvatars.beardMan, fit: BoxFit.cover),

          ),
        ),
      ),
    );
  }
}
