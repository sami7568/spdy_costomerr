class PasswordUpdateResponse {
  String? msg;
  int? status;

  PasswordUpdateResponse({this.msg, this.status});

  PasswordUpdateResponse.fromJson(Map<String, dynamic> json) {
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