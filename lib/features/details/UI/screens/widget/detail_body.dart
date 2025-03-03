import 'package:animes_app/features/details/UI/screens/widget/staff_card.dart';
import 'package:animes_app/features/details/UI/screens/widget/custom_button.dart';
import 'package:flutter/material.dart';

import 'detail_anime_card.dart';

class DetailBody extends StatefulWidget {
  const DetailBody({super.key});

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: DetailAnimeCard(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Morbius",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          "2022",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 26,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "7.0",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex...",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد العناصر في كل صف
            childAspectRatio: 3, // نسبة العرض إلى الارتفاع
            crossAxisSpacing: 7, // التباعد الأفقي
            mainAxisSpacing: 7, // التباعد الرأسي
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return StaffCard(
                imageUrl: "assets/img/Staff Img.png",
                name: "Maria Espaes",
                role: "Morbius",
              );
            },
            childCount: 7,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: CustomButton(
            onPressed: () {},
            title: "Watch Now",
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}
