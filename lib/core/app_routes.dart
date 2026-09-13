import 'package:flutter/material.dart';
import '../features/onboarding_screen/onboarding_screen.dart';
import '../features/splash_screen/splash_screen.dart';
class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}