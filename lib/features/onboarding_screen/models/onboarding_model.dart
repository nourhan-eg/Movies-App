import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_images.dart';
import 'package:movies/core/app_texts.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;
  final Color gradientColor;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
    required this.gradientColor,
  });
}

const List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: AppImages.intro1,
    title: AppTexts.onboardingTitle1,
    description: AppTexts.onboardingDesc1,
    gradientColor: AppColors.black,
  ),
  OnboardingModel(
    image: AppImages.intro2,
    title: AppTexts.onboardingTitle2,
    description: AppTexts.onboardingDesc2,
    gradientColor: AppColors.mint,
  ),
  OnboardingModel(
    image: AppImages.intro3,
    title: AppTexts.onboardingTitle3,
    description: AppTexts.onboardingDesc3,
    gradientColor: AppColors.darkRed,
  ),
  OnboardingModel(
    image: AppImages.intro4,
    title: AppTexts.onboardingTitle4,
    description: AppTexts.onboardingDesc4,
    gradientColor: AppColors.purple,
  ),
  OnboardingModel(
    image: AppImages.intro5,
    title: AppTexts.onboardingTitle5,
    description: AppTexts.onboardingDesc5,
    gradientColor: AppColors.burgundy,
  ),
  OnboardingModel(
    image: AppImages.intro6,
    title: AppTexts.onboardingTitle6,
    description: '',
    gradientColor: AppColors.darkGrey2,
  ),
];
