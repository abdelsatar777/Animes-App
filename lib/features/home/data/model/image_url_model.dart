class ImageUrlModel {
  final String imageUrl;

  ImageUrlModel({required this.imageUrl});

  factory ImageUrlModel.fromJson(Map<String, dynamic> json) {
    return ImageUrlModel(imageUrl: json["jpg"]["image_url"] ?? "");
  }
}
