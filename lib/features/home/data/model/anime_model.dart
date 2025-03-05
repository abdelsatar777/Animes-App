import 'package:animes_app/features/home/data/model/entry_model.dart';

class AnimeModel {
  final EntryModel entry;
  final String url;
  final String votes;

  AnimeModel({required this.entry, required this.url, required this.votes});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      entry: EntryModel.fromJson(json["entry"]),
      url: json["url"] ?? "No Url",
      votes: json["votes"].toString(),
    );
  }
}
