import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/widgets/custom_button.dart';

class EditProfileActions extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const EditProfileActions({
    super.key,
    required this.isLoading,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Delete Account',
          onPressed: isLoading ? () {} : onDelete,
          backgroundColor: AppColors.red,
          textColor: AppColors.white,
          isLoading: false,
        ),
        const SizedBox(height: 12),
        CustomButton(
          text: 'Update Data',
          onPressed: isLoading ? () {} : onUpdate,
          backgroundColor: AppColors.yellow,
          textColor: AppColors.dark,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
