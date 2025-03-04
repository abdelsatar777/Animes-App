import 'package:animes_app/core/network/api_service.dart';
import 'package:animes_app/features/details/data/repo/details_repo_impl.dart';
import 'package:animes_app/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/genres/data/repo/genres_repo_impl.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<GenresRepoImpl>(
    GenresRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
