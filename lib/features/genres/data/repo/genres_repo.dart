import 'package:animes_app/features/genres/data/model/genres_model.dart';
import 'package:dartz/dartz.dart';

abstract class GenresRepo {
  Future<Either<String, List<GenresModel>>> getGenres();
}
