class SignupResponse {
  SignupUserInfo? signupuserInfo;
  String? msg;
  int? status;

  SignupResponse({this.signupuserInfo, this.msg, this.status});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    signupuserInfo = json['user_info'] != null
        ? new SignupUserInfo.fromJson(json['user_info'])
        : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.signupuserInfo != null) {
      data['user_info'] = this.signupuserInfo!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
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
  int? userId;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user_id"] = this.userId;
    data['user_name'] = this.userName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['user_status'] = this.userStatus;
    data['is_deleted'] = this.isDeleted;
    data['is_varified'] = this.isVarified;
    data['signup_date'] = this.signupDate;
    data['last_signin'] = this.lastSignin;
    data['device_type'] = this.deviceType;
    return data;
  }
}