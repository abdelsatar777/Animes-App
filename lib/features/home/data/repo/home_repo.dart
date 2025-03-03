import 'package:animes_app/features/home/data/model/best_anime_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<String, List<BestAnimeModel>>> getBestAnime();
}
