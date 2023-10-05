class ReqBaseModel {
  ReqBaseModel({
    required this.appToken,
  });
  late final String appToken;

  ReqBaseModel.fromJson(Map<String, dynamic> json) {
    appToken = json['appToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['appToken'] = appToken;
    return data;
  }
}
