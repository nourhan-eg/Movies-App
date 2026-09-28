import 'package:flutter/material.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}
