import 'package:animes_app/features/details/data/model/details_model.dart';
import 'package:animes_app/features/details/data/model/staff_model.dart';
import 'package:animes_app/features/details/data/repo/details_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/api_service.dart';

class DetailsRepoImpl implements DetailsRepo {
  final ApiService apiService;

  DetailsRepoImpl({required this.apiService});

  @override
  Future<Either<String, DetailsModel>> getDetails({required String id}) async {
    try {
      var data = await apiService.get(endPoint: "anime/$id/full");
      return Right(DetailsModel.fromJson(json: data["data"]));
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, List<StaffModel>>> getStaff({required String id}) async {
    List<StaffModel> staff = [];
    try {
      var data = await apiService.get(endPoint: "anime/$id/staff");
      for (var i in data["data"]) {
        staff.add(StaffModel.fromJson(json: i));
      }
      return Right(staff);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
