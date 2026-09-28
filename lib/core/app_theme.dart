import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/text_styles.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: TextTheme(
      headlineLarge:TextStyles.heading1(AppColors.white),
      headlineMedium:TextStyles.heading2(AppColors.white),
      headlineSmall:TextStyles.headingSmall(AppColors.yellow),
      titleLarge:TextStyles.title2(AppColors.dark),
      titleMedium:TextStyles.title1(AppColors.white),
      bodySmall:TextStyles.textSmall(AppColors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.yellow,
    foregroundColor: AppColors.darkGrey,
    disabledBackgroundColor: AppColors.yellow.withValues(alpha: 0.5),
    disabledForegroundColor: AppColors.darkGrey.withValues(alpha: 0.7),
    textStyle: TextStyles.title2(AppColors.dark),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 0,
  ),
  ),

  );


}