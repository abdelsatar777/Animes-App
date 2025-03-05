import 'package:animes_app/features/genres/UI/manager/genres_state.dart';
import 'package:animes_app/features/genres/data/repo/genres_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenresCubit extends Cubit<GenresState> {
  final GenresRepo genresRepo;

  GenresCubit({required this.genresRepo}) : super(InitialState());

  getGenres() async {
    emit(LoadingState());
    var values = await genresRepo.getGenres();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (genres) {
        emit(SuccessState(genres: genres));
      },
    );
  }
}
