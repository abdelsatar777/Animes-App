import 'package:animes_app/features/details/UI/manager/Details/details_cubit.dart';
import 'package:animes_app/features/details/UI/manager/Staff/staff_cubit.dart';
import 'package:animes_app/features/details/data/repo/details_repo_impl.dart';
import 'package:animes_app/features/genres/UI/manager/genres_cubit.dart';
import 'package:animes_app/features/home/UI/manager/anime/anime_cubit.dart';
import 'package:animes_app/features/home/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/di.dart';
import 'core/resource/app_colors.dart';
import 'features/genres/UI/screens/genres_screen.dart';
import 'features/genres/data/repo/genres_repo_impl.dart';
import 'features/home/UI/manager/best anime/best_anime_cubit.dart';
import 'features/home/UI/screens/home_page_wrapper.dart';
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
        BlocProvider(
          create: (context) => AnimeCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..getAnime(),
        ),
        BlocProvider(
          create: (context) => GenresCubit(
            genresRepo: getIt.get<GenresRepoImpl>(),
          )..getGenres(),
        ),
        BlocProvider(
          create: (context) =>
              DetailsCubit(detailsRepo: getIt.get<DetailsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              StaffCubit(detailsRepo: getIt.get<DetailsRepoImpl>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "home_page_wrapper": (context) => HomePageWrapper(),
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
