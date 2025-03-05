import 'package:animes_app/features/details/data/repo/details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsRepo detailsRepo;

  DetailsCubit({required this.detailsRepo}) : super(InitialState());

  getDetails({required String id}) async {
    emit(LoadingState());
    var values = await detailsRepo.getDetails(id: id);
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (details) {
        emit(SuccessState(details: details));
      },
    );
  }
}
