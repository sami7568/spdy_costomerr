class DriverRatingResponse {
  UserInfo? userInfo;
  String? msg;
  int? status;

  DriverRatingResponse({this.userInfo, this.msg, this.status});

  DriverRatingResponse.fromJson(Map<String, dynamic> json) {
    userInfo = json['user_info'] != null
        ? UserInfo.fromJson(json['user_info'])
        : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    data['msg'] = msg;
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_rating'] = driverRating;
    return data;
  }
}