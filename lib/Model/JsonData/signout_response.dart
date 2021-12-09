// ignore: file_names
class SignoutResponse {
  String? msg;
  int? status;

  SignoutResponse({this.msg, this.status});

  SignoutResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}