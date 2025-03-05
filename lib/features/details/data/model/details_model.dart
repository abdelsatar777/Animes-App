import 'package:animes_app/features/home/data/model/image_url_model.dart';

class DetailsModel {
  final String malId;
  final String url;
  final ImageUrlModel imageUrlModel;
  final String title;
  final String score;
  final String synopsis;
  final String year;

  DetailsModel({
    required this.malId,
    required this.url,
    required this.imageUrlModel,
    required this.title,
    required this.score,
    required this.synopsis,
    required this.year,
  });

  factory DetailsModel.fromJson({required Map<String, dynamic> json}) {
    return DetailsModel(
      malId: json["mal_id"].toString(),
      url: json["url"] ?? "No Url",
      imageUrlModel: ImageUrlModel.fromJson(json["images"]),
      title: json["title"] ?? "No Title",
      score: json["score"].toString(),
      synopsis: json["synopsis"] ?? "No Description",
      year: json["year"].toString(),
    );
  }
}
