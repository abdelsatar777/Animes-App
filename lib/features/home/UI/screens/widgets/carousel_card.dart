import 'package:animes_app/core/resource/app_assets.dart';
import 'package:animes_app/features/home/data/model/best_anime_model.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final BestAnimeModel bestAnimeModel;

  const CarouselCard({super.key, required this.bestAnimeModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
              bestAnimeModel.imageUrl.imageUrl,
            ),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) =>
                AssetImage(AppAssets.defaultImage),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 30,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // يضمن عدم خروج المحتوى عن حدود Row
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bestAnimeModel.title,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          // يحدد أقصى عدد للأسطر
                          overflow: TextOverflow.ellipsis,
                          // يضيف ... إذا زاد النص
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          bestAnimeModel.duration,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min, // يمنع تمدد النجمة والتقييم
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 26,
                      ),
                      SizedBox(width: 4), // مسافة صغيرة بين النجمة والنص
                      Text(
                        bestAnimeModel.score,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
