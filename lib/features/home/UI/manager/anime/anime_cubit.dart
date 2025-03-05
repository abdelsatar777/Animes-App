import 'package:animes_app/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  final HomeRepo homeRepo;

  AnimeCubit({required this.homeRepo}) : super(InitialState());

  getAnime() async {
    emit(LoadingState());
    var values = await homeRepo.getAnime();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (anime) {
        emit(SuccessState(anime: anime));
      },
    );
  }
}
