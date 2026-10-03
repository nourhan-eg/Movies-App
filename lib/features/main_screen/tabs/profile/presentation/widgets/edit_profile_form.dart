import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_icons.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/text_styles.dart';
import 'package:movies/core/validator.dart';
import 'package:movies/core/widgets/custom_text_field.dart';

class EditProfileForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const EditProfileForm({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: nameController,
          hintText: 'Name',
          prefixIcon: AppIcons.nameIcon,
          keyboardType: TextInputType.name,
          validator: Validators.name,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: phoneController,
          hintText: 'Phone',
          prefixIcon: AppIcons.phoneIcon,
          keyboardType: TextInputType.phone,
          validator: Validators.phone,
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.forgetPassword),
          child: Text(
            'Reset Password',
            style: TextStyles.textSmall(AppColors.white),
          ),
        ),
      ],
    );
  }
}
