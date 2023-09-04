class PressReleasesModel {
  Id? iId;
  int? date;
  List<AllPressReleases>? allPressReleases;

  PressReleasesModel({this.iId, this.date, this.allPressReleases});

  PressReleasesModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    date = json['date'];
    if (json['all_press_releases'] != null) {
      allPressReleases = <AllPressReleases>[];
      json['all_press_releases'].forEach((v) {
        allPressReleases!.add(AllPressReleases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['date'] = date;
    if (allPressReleases != null) {
      data['all_press_releases'] =
          allPressReleases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$oid'] = oid;
    return data;
  }
}

class AllPressReleases {
  String? ministry;
  List<PressReleases>? pressReleases;

  AllPressReleases({this.ministry, this.pressReleases});

  AllPressReleases.fromJson(Map<String, dynamic> json) {
    ministry = json['ministry'];
    if (json['press_releases'] != null) {
      pressReleases = <PressReleases>[];
      json['press_releases'].forEach((v) {
        pressReleases!.add(PressReleases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ministry'] = ministry;
    if (pressReleases != null) {
      data['press_releases'] = pressReleases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PressReleases {
  String? prId;
  String? title;
  List<String>? descriptiveText;
  List<String>? imageUrls;
  List<String>? keyWords;
  int? date;
  String? language;

  PressReleases(
      {this.prId,
      this.title,
      this.descriptiveText,
      this.imageUrls,
      this.keyWords,
      this.date,
      this.language});

  PressReleases.fromJson(Map<String, dynamic> json) {
    prId = json['prId'];
    title = json['title'];
    descriptiveText = json['descriptive_text'].cast<String>();
    imageUrls = json['imageUrls'].cast<String>();
    keyWords = json['key_words'].cast<String>();
    date = json['date'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prId'] = prId;
    data['title'] = title;
    data['descriptive_text'] = descriptiveText;
    data['imageUrls'] = imageUrls;
    data['key_words'] = keyWords;
    data['date'] = date;
    data['language'] = language;
    return data;
  }
}
