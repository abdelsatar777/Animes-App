class GenresModel {
  final String malId;
  final String name;
  final String url;

  GenresModel({required this.malId, required this.name, required this.url});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      malId: json["mal_id"].toString(),
      name: json["name"] ?? "No Name",
      url: json["url"] ?? "No Url",
    );
  }
}
