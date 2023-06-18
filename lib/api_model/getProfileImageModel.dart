class GetProfileImageModel {
  final bool status;
  final List<String> images;

  GetProfileImageModel({
    required this.status,
    required this.images,
  });

  factory GetProfileImageModel.fromJson(Map<String, dynamic> json) {
    return GetProfileImageModel(
      status: json['status'],
      images: List<String>.from(json['images']),
    );
  }
}
