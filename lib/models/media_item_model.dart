class MediaItemModel {
  String id;
  String mediaUrl;
  String description;
  bool isVideo;

  MediaItemModel(
      {required this.id,
      required this.mediaUrl,
      required this.description,
      required this.isVideo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mediaUrl': mediaUrl,
      'description': description,
      'isVideo': isVideo,
    };
  }

  factory MediaItemModel.fromMap(Map<String, dynamic> map) {
    return MediaItemModel(
      id: map['id'],
      mediaUrl: map['mediaUrl'],
      description: map['description'],
      isVideo: map['isVideo'],
    );
  }
}
