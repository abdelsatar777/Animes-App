import 'package:animes_app/features/home/data/model/image_url_model.dart';

class PersonModel {
  final String malId;
  final String url;
  final ImageUrlModel imageUrlModel;
  final String name;

  PersonModel({
    required this.malId,
    required this.url,
    required this.imageUrlModel,
    required this.name,
  });

  factory PersonModel.fromJson({required Map<String, dynamic> json}) {
    return PersonModel(
      malId: json["mal_id"].toString(),
      url: json["url"] ?? "No Url",
      imageUrlModel: ImageUrlModel.fromJson(json["images"]),
      name: json["name"] ?? "No Name",
    );
  }
}
