import 'package:animes_app/features/home/data/model/anime_model.dart';

abstract class AnimeState {}

class InitialState extends AnimeState {}

class LoadingState extends AnimeState {}

class SuccessState extends AnimeState {
  final List<AnimeModel> anime;

  SuccessState({required this.anime});
}

class ErrorState extends AnimeState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
