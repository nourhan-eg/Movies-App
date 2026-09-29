import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_images.dart';

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
    title: 'Find Your Next Favorite Movie Here',
    description:
        'Get access to a huge library of movies to suit all tastes. You will surely like it.',
    gradientColor: AppColors.black,
  ),
  OnboardingModel(
    image: AppImages.intro2,
    title: 'Discover Movies',
    description:
        'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    gradientColor: AppColors.mint,
  ),
  OnboardingModel(
    image: AppImages.intro3,
    title: 'Explore All Genres',
    description:
        'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    gradientColor: AppColors.darkRed,
  ),
  OnboardingModel(
    image: AppImages.intro4,
    title: 'Create Watchlists',
    description:
        'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    gradientColor: AppColors.purple,
  ),
  OnboardingModel(
    image: AppImages.intro5,
    title: 'Rate, Review, and Learn',
    description:
        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    gradientColor: AppColors.burgundy,
  ),
  OnboardingModel(
    image: AppImages.intro6,
    title: 'Start Watching Now',
    description: '',
    gradientColor: AppColors.darkGrey2,
  ),
];
