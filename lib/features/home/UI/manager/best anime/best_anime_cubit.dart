import 'package:animes_app/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_anime_state.dart';

class BestAnimeCubit extends Cubit<BestAnimeState> {
  final HomeRepo homeRepo;

  BestAnimeCubit({required this.homeRepo}) : super(InitialState());

  getBestAnime() async {
    emit(LoadingState());
    var values = await homeRepo.getBestAnime();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (bestAnime) {
        emit(SuccessState(bestAnime: bestAnime));
      },
    );
  }
}
