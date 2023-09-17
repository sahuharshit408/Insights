class PressRelease {
  PressRelease({
    required this.date,
    required this.ministry,
    required this.prId,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.videoUrls,
    required this.keyWords,
    required this.language,
    required this.status,
  });
  late final int date;
  late final String ministry;
  late final String prId;
  late final String title;
  late final List<String> description;
  late final List<String> imageUrls;
  late final List<VideoUrls> videoUrls;
  late final List<String> keyWords;
  late final String language;
  late final String status;

  PressRelease.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    ministry = json['ministry'];
    prId = json['prId'];
    title = json['title'];
    description = List.castFrom<dynamic, String>(json['description']);
    imageUrls = List.castFrom<dynamic, String>(json['imageUrls']);
    videoUrls =
        List.from(json['videoUrls']).map((e) => VideoUrls.fromJson(e)).toList();
    keyWords = List.castFrom<dynamic, String>(json['keyWords']);
    language = json['language'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['ministry'] = ministry;
    data['prId'] = prId;
    data['title'] = title;
    data['description'] = description;
    data['imageUrls'] = imageUrls;
    data['videoUrls'] = videoUrls.map((e) => e.toJson()).toList();
    data['keyWords'] = keyWords;
    data['language'] = language;
    data['status'] = status;
    return data;
  }
}

class VideoUrls {
  VideoUrls({
    required this.language,
    required this.url,
  });
  late final String language;
  late final String url;

  VideoUrls.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['language'] = language;
    data['url'] = url;
    return data;
  }
}
