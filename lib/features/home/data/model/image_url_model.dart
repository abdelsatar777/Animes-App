class ImageUrlModel {
  final String imageUrl;

  ImageUrlModel({required this.imageUrl});

  factory ImageUrlModel.fromJson(Map<String, dynamic> json) {
    return ImageUrlModel(
      imageUrl: json["jpg"]["large_image_url"] ?? "No Url",
    );
  }
}
