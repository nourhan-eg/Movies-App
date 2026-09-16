import 'package:flutter/material.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/features/onboarding_screen/models/onboarding_model.dart';
import 'package:movies/features/onboarding_screen/widgets/onboarding_page_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const routeName = "onboarding route";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void _next() {
    if (currentPage == onboardingData.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) => setState(() => currentPage = index),
        itemBuilder: (context, index) => OnboardingPageItem(
          data: onboardingData[index],
          isFirst: index == 0,
          isLast: index == onboardingData.length - 1,
          onNext: _next,
          onBack: _back,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
