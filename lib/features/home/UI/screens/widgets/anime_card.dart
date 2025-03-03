import 'package:animes_app/core/resource/app_assets.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed("detail_screen");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.defaultImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("Name", style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }
}
