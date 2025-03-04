import 'package:animes_app/core/network/api_service.dart';
import 'package:animes_app/features/home/data/model/anime_model.dart';
import 'package:animes_app/features/home/data/model/best_anime_model.dart';
import 'package:animes_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<BestAnimeModel>>> getBestAnime() async {
    List<BestAnimeModel> bestAnime = [];
    try {
      var data = await apiService.get(endPoint: "anime");
      for (var i in data["data"]) {
        bestAnime.add(BestAnimeModel.fromJson(i));
      }
      return Right(bestAnime);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, List<AnimeModel>>> getAnime() async {
    List<AnimeModel> anime = [];
    try {
      var data = await apiService.get(endPoint: "anime/1/recommendations");
      for (var i in data["data"]) {
        anime.add(AnimeModel.fromJson(i));
      }
      return Right(anime);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
