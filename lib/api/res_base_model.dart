class ResBaseModel {
  ResBaseModel({
    required this.data,
    required this.message,
    required this.status,
  });
  late final Data data;
  late final String message;
  late final bool status;

  ResBaseModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final d = <String, dynamic>{};
    d['data'] = data.toJson();
    d['message'] = message;
    d['status'] = status;
    return d;
  }
}

class Data {
  Data({
    required this.userid,
  });
  late final String userid;

  Data.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userid'] = userid;
    return data;
  }
}
