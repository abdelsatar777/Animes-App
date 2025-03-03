import 'package:animes_app/core/network/di.dart';
import 'package:animes_app/core/resource/app_colors.dart';
import 'package:animes_app/features/details/UI/screens/detail_screen.dart';
import 'package:animes_app/features/genres/UI/screens/genres_screen.dart';
import 'package:animes_app/features/home/UI/manager/best_anime_cubit.dart';
import 'package:animes_app/features/home/UI/screens/home_page_wrapper.dart';
import 'package:animes_app/features/home/UI/screens/home_screen.dart';
import 'package:animes_app/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUp();
  runApp(AnimesApp());
}

class AnimesApp extends StatelessWidget {
  const AnimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BestAnimeCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..getBestAnime(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "home_page_wrapper": (context) => HomePageWrapper(),
          "detail_screen": (context) => DetailScreen(),
          "genres_screen": (context) => GenresScreen(),
        },
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
