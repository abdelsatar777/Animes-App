import 'package:animes_app/features/home/UI/manager/anime/anime_cubit.dart';
import 'package:animes_app/features/home/UI/manager/anime/anime_state.dart';
import 'package:animes_app/features/home/UI/screens/widgets/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'anime_carousel_slider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) {
        if (state is SuccessState) {
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Icon(Icons.navigate_next,
                                color: Colors.white, size: 30),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        AnimeCard(animeModel: state.anime[index]),
                    childCount:
                        state.anime.length, // يضمن عدم تجاوز العدد الفعلي
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10, // مسافة بين العناصر
                    mainAxisSpacing: 10, // مسافة رأسية لمنع التكدس
                    childAspectRatio: 0.75, // تناسب أفضل بين العرض والارتفاع
                  ),
                ),
              ],
            ),
          );
        } else if (state is ErrorState) {
          return Center(child: Text("Error ${state.errorMsg}"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
