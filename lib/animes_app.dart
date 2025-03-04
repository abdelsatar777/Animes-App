import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/di.dart';
import 'core/resource/app_colors.dart';
import 'features/details/UI/screens/detail_screen.dart';
import 'features/genres/UI/screens/genres_screen.dart';
import 'features/home/UI/manager/best_anime_cubit.dart';
import 'features/home/UI/screens/home_page_wrapper.dart';
import 'features/home/UI/screens/home_screen.dart';
import 'features/home/data/repo/home_repo_impl.dart';

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
