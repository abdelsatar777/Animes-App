import 'package:animes_app/features/home/UI/manager/best%20anime/best_anime_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/best anime/best_anime_state.dart';
import 'carousel_card.dart';

class AnimeCarouselSlider extends StatelessWidget {
  const AnimeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestAnimeCubit, BestAnimeState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return CarouselSlider.builder(
            itemCount: state.bestAnime.length,
            options: CarouselOptions(
              height: 250.0,
              autoPlay: true,
              viewportFraction: 1.0,
            ),
            itemBuilder: (context, index, realIndex) {
              return CarouselCard(bestAnimeModel: state.bestAnime[index]);
            },
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
