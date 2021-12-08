class DriverRatingResponse {
  UserInfo? userInfo;
  String? msg;
  int? status;

  DriverRatingResponse({this.userInfo, this.msg, this.status});

  DriverRatingResponse.fromJson(Map<String, dynamic> json) {
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
  String? driverRating;

  UserInfo({this.driverRating});

  UserInfo.fromJson(Map<String, dynamic> json) {
    driverRating = json['driver_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_rating'] = this.driverRating;
    return data;
  }
}