class ReqBaseModel {
  ReqBaseModel({
    required this.appToken,
  });
  late final String appToken;

  ReqBaseModel.fromJson(Map<String, dynamic> json){
    appToken = json['appToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['appToken'] = appToken;
    return _data;
  }
}