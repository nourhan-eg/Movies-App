import 'package:flutter/material.dart';
import '../features/auth/forget_password/presentation/screens/reset_password.dart';
import '../features/auth/login/presentation/screens/login_screen.dart';
import '../features/auth/register/presentation/screens/signup_screen.dart';
import '../features/main_screen/presentation/screens/main_screen.dart';
import '../features/onboarding_screen/onboarding_screen.dart';
import '../features/splash_screen/splash_screen.dart';
class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
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
      case main:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
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