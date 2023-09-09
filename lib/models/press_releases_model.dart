class PressRelease {
  final int date;
  final String ministry;
  final String prId;
  final String title;
  final List<String> description;
  final String thumbnail;

  PressRelease({
    required this.date,
    required this.ministry,
    required this.prId,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  factory PressRelease.fromJson(Map<String, dynamic> json) {
    return PressRelease(
      date: json['date'],
      ministry: json['ministry'],
      prId: json['prId'],
      title: json['title'],
      description: List<String>.from(json['description']),
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'ministry': ministry,
      'prId': prId,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
    };
  }
}
