import 'image_url_model.dart';

class EntryModel {
  final String malId;
  final String url;
  final ImageUrlModel imageUrlModel;
  final String title;

  EntryModel({
    required this.malId,
    required this.url,
    required this.imageUrlModel,
    required this.title,
  });

  factory EntryModel.fromJson(Map<String, dynamic> json) {
    return EntryModel(
      malId: json["mal_id"].toString(),
      url: json["url"] ?? "No Url",
      imageUrlModel: ImageUrlModel.fromJson(json["images"]),
      title: json["title"] ?? "No Title",
    );
  }
}
