import 'package:animes_app/features/details/data/model/details_model.dart';

abstract class DetailsState {}

class InitialState extends DetailsState {}

class LoadingState extends DetailsState {}

class SuccessState extends DetailsState {
  final DetailsModel details;

  SuccessState({required this.details});
}

class ErrorState extends DetailsState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
