class LoginResponse {
  UserInfo? userInfo;
  String? msg;
  int? status;

  LoginResponse({this.userInfo, this.msg, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class UserInfo {
  int? userId;
  String? userName;
  String? phoneNumber;
  String? email;
  String? pass;

  UserInfo({this.userId, this.userName, this.phoneNumber, this.email});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    return data;
  }
}