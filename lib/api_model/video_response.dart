class VideoResponse {
  final String videoUrl;

  VideoResponse({required this.videoUrl});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      videoUrl: json['video'] ?? '',
    );
  }
}
