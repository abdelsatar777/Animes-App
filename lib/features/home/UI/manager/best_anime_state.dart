import 'package:animes_app/features/home/data/model/best_anime_model.dart';

abstract class BestAnimeState {}

class InitialState extends BestAnimeState {}

class LoadingState extends BestAnimeState {}

class SuccessState extends BestAnimeState {
  final List<BestAnimeModel> bestAnime;

  SuccessState({required this.bestAnime});
}

class ErrorState extends BestAnimeState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
