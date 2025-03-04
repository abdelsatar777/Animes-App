import 'package:animes_app/core/resource/app_assets.dart';
import 'package:animes_app/core/resource/app_colors.dart';
import 'package:flutter/material.dart';

class DetailAnimeCard extends StatelessWidget {
  final String imgPath;

  const DetailAnimeCard({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgPath),
              fit: BoxFit.cover,
              onError: (_, __) =>
                  AssetImage(AppAssets.defaultImage) as ImageProvider,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.primaryColor.withOpacity(0.2),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
