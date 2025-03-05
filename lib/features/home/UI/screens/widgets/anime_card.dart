import 'package:animes_app/features/details/UI/screens/detail_screen.dart';
import 'package:animes_app/features/home/data/model/anime_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resource/app_assets.dart';

class AnimeCard extends StatelessWidget {
  final AnimeModel animeModel;

  const AnimeCard({super.key, required this.animeModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(id: animeModel.entry.malId),
          ),
        );
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
                image: NetworkImage(animeModel.entry.imageUrlModel.imageUrl),
                fit: BoxFit.cover,
                onError: (_, __) => AssetImage(AppAssets.defaultImage)
                    as ImageProvider, // صورة افتراضية عند الخطأ
              ),
            ),
          ),
          SizedBox(height: 8), // مسافة صغيرة بين الصورة والنص
          SizedBox(
            width: 150, // تحديد العرض لمنع تجاوز النص
            child: Text(
              animeModel.entry.title,
              maxLines: 2, // يمنع Overflow بجعل النص على سطرين كحد أقصى
              overflow: TextOverflow.ellipsis, // يضيف "..." عند تجاوز النص
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
