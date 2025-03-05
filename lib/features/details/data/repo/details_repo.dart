import 'package:animes_app/features/details/data/model/details_model.dart';
import 'package:animes_app/features/details/data/model/staff_model.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRepo {
  Future<Either<String, DetailsModel>> getDetails({required String id});

  Future<Either<String, List<StaffModel>>> getStaff({required String id});
}
