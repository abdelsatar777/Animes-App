import 'package:animes_app/core/resource/app_assets.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<Offset>(begin: Offset(0, 3), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.pushNamed(context, "start_screen"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: animation,
        child: Image.asset(
          AppAssets.logoImage,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/*
Container(
width: double.infinity,
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
Colors.transparent, // اللون في الأعلى
AppColors.primaryColor, // اللون في الأسفل
],
),
),
child: Image.asset(
AppAssets.wallpaperImage,
fit: BoxFit.cover,
),
),*/
