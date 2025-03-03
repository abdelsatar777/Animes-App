import 'package:animes_app/features/home/UI/screens/widgets/anime_card.dart';
import 'package:animes_app/features/genres/UI/screens/widget/genres_card.dart';
import 'package:flutter/material.dart';
import 'anime_carousel_slider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              "New Release",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                letterSpacing: 3,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: AnimeCarouselSlider()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Genres",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "genres_screen"),
                  child: Row(
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Icon(Icons.navigate_next, color: Colors.white, size: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenresCard(title: "Action"),
                SizedBox(width: 10),
                GenresCard(title: "Action"),
                SizedBox(width: 10),
                GenresCard(title: "Action"),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => AnimeCard(),
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
