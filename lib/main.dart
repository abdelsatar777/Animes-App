import 'package:animes_app/core/resource/app_colors.dart';
import 'package:animes_app/features/home/UI/screens/home_screen.dart';
import 'package:animes_app/features/start/UI/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'features/start/UI/screens/splash_screen.dart';

void main() {
  runApp(AnimesApp());
}

class AnimesApp extends StatelessWidget {
  const AnimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "start_screen": (context) => StartScreen(),
        "home_screen": (context) => HomeScreen(),
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
      home: SplashScreen(),
    );
  }
}
