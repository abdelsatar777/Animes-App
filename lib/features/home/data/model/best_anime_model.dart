import 'image_url_model.dart';

class BestAnimeModel {
  final String title;
  final String duration;
  final String score;
  final ImageUrlModel imageUrl;

  BestAnimeModel({
    required this.title,
    required this.duration,
    required this.score,
    required this.imageUrl,
  });

  factory BestAnimeModel.fromJson(Map<String, dynamic> json) {
    return BestAnimeModel(
      title: json["title"] ?? "No Title",
      duration: json["duration"] ?? "No Date",
      score: json["score"].toString(),
      imageUrl: ImageUrlModel.fromJson(json["images"]),
    );
  }
}
