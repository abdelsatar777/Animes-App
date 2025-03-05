import 'package:animes_app/features/details/UI/manager/Staff/staff_state.dart';
import 'package:animes_app/features/details/data/repo/details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffCubit extends Cubit<StaffState> {
  final DetailsRepo detailsRepo;

  StaffCubit({required this.detailsRepo}) : super(InitialState());

  getStaff({required String id}) async {
    emit(LoadingState());
    var values = await detailsRepo.getStaff(id: id);
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (staff) {
        emit(SuccessState(staff: staff));
      },
    );
  }
}
