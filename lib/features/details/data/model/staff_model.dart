import 'package:animes_app/features/details/data/model/person_model.dart';

class StaffModel {
  final PersonModel personModel;
  final List<String> positions;

  StaffModel({
    required this.personModel,
    required this.positions,
  });

  factory StaffModel.fromJson({required Map<String, dynamic> json}) {
    return StaffModel(
      personModel: PersonModel.fromJson(json: json["person"]),
      positions: List<String>.from(json["positions"] ?? []), // ✅ حل المشكلة
    );
  }
}
