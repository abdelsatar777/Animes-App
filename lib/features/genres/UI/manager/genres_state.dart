import 'package:animes_app/features/genres/data/model/genres_model.dart';

abstract class GenresState {}

class InitialState extends GenresState {}

class LoadingState extends GenresState {}

class SuccessState extends GenresState {
  final List<GenresModel> genres;

  SuccessState({required this.genres});
}

class ErrorState extends GenresState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
