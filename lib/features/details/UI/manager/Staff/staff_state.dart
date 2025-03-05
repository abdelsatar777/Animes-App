import 'package:animes_app/features/details/data/model/staff_model.dart';

abstract class StaffState {}

class InitialState extends StaffState {}

class LoadingState extends StaffState {}

class SuccessState extends StaffState {
  final List<StaffModel> staff;

  SuccessState({required this.staff});
}

class ErrorState extends StaffState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
