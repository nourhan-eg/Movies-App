import 'package:flutter/material.dart';
import 'package:movies/features/home/home_screen.dart';
import '../features/auth/forget_password/presentation/screens/reset_password.dart';
import '../features/auth/login/presentation/screens/login_screen.dart';
import '../features/auth/register/presentation/screens/signup_screen.dart';
import '../features/onboarding_screen/onboarding_screen.dart';
import '../features/splash_screen/splash_screen.dart';
class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String forgetPassword = '/forget';

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
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );


      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}