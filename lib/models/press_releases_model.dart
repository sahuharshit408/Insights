class PressRelease {
  PressRelease({
    required this.date,
    required this.ministry,
    required this.prId,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.audioUrls,
    required this.videoUrl,
    required this.keyWords,
    required this.language,
    required this.status,
  });
  late final double date;
  late final String ministry;
  late final String prId;
  late final String title;
  late final List<String> description;
  late final List<String> imageUrls;
  late final List<AudioUrls> audioUrls;
  late final String videoUrl;
  late final List<String> keyWords;
  late final String language;
  late final String status;

  PressRelease.fromJson(Map<String, dynamic> json) {
    date = double.tryParse('${json['date']}') ?? 0;
    ministry = json['ministry'];
    prId = json['prId'];
    title = json['title'];
    description = List.castFrom<dynamic, String>(json['description']);
    imageUrls = List.castFrom<dynamic, String>(json['imageUrls']);
    audioUrls =
        List.from(json['audioUrls']).map((e) => AudioUrls.fromJson(e)).toList();
    videoUrl = json['videoUrl'];
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
    data['audioUrls'] = audioUrls.map((e) => e.toJson()).toList();
    data['keyWords'] = keyWords;
    data['language'] = language;
    data['status'] = status;
    return data;
  }
}

class AudioUrls {
  AudioUrls({
    required this.language,
    required this.url,
  });
  late final String language;
  late final String url;

  AudioUrls.fromJson(Map<String, dynamic> json) {
    try {
      language = json['language'];
      url = json['url'];
    } catch (e) {
      language = '';
      url = '';
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['language'] = language;
    data['url'] = url;
    return data;
  }
}
