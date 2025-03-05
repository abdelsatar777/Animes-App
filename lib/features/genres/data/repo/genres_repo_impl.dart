import 'package:animes_app/features/genres/data/model/genres_model.dart';
import 'package:animes_app/features/genres/data/repo/genres_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/api_service.dart';

class GenresRepoImpl implements GenresRepo {
  final ApiService apiService;

  GenresRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<GenresModel>>> getGenres() async {
    List<GenresModel> genres = [];
    try {
      var data = await apiService.get(endPoint: "genres/anime");
      for (var i in data["data"]) {
        genres.add(GenresModel.fromJson(i));
      }
      return Right(genres);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
