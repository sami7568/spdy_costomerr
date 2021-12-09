class SignupResponse {
  SignupUserInfo? signupuserInfo;
  String? msg;
  int? status;

  SignupResponse({this.signupuserInfo, this.msg, this.status});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    signupuserInfo = json['user_info'] != null
        ? SignupUserInfo.fromJson(json['user_info'])
        : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (signupuserInfo != null) {
      data['user_info'] = signupuserInfo!.toJson();
    }
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class SignupUserInfo {
  String? userName;
  String? phoneNumber;
  String? email;
  String? password;
  String? userStatus;
  int? isDeleted;
  String? isVarified;
  String? signupDate;
  String? lastSignin;
  String? deviceType;
  String? userId;

  SignupUserInfo(
      {this.userId,
        this.userName,
        this.phoneNumber,
        this.email,
        this.password,
        this.userStatus,
        this.isDeleted,
        this.isVarified,
        this.signupDate,
        this.lastSignin,
        this.deviceType});

  SignupUserInfo.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    userName = json['user_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
    userStatus = json['user_status'];
    isDeleted = json['is_deleted'];
    isVarified = json['is_varified'];
    signupDate = json['signup_date'];
    lastSignin = json['last_signin'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = userId;
    data['user_name'] = userName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    data['user_status'] = userStatus;
    data['is_deleted'] = isDeleted;
    data['is_varified'] = isVarified;
    data['signup_date'] = signupDate;
    data['last_signin'] = lastSignin;
    data['device_type'] = deviceType;
    return data;
  }
}