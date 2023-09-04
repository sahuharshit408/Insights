class ResBasicModel {
  ResBasicModel({
    required this.status,
    required this.data,
  });
  late final int status;
  late final String data;

  ResBasicModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data;
    return _data;
  }
}