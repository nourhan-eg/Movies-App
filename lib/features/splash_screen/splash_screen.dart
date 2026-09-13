import 'package:flutter/material.dart';
import 'package:movies/core/app_images.dart';
import 'package:movies/core/app_routes.dart';

import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = "splash route";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(
        context, AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Center(
              child: Image.asset(
                AppImages.moviesLogo,
                width: 253,
                height: 253,
              ),
            ),
            const Spacer(flex: 3),
            Image.asset(
              AppImages.routeLogo,
              width: 214,
            ),
          ],
        ),
      ),
    );
  }
}