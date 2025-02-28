import 'package:animes_app/features/start/UI/screens/widgets/slanted_clipper.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resource/app_assets.dart';

class StartCard extends StatelessWidget {
  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SlantedClipper(),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.defaultImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
