class BookingResponse {
  UserInfo? userInfo;
  String? msg;
  int? status;

  BookingResponse({this.userInfo, this.msg, this.status});

  BookingResponse.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? driverId;
  String? pickUpLocation;
  String? dropOfLocation;
  String? bookingType;
  int? isDeleted;
  String? orderDate;
  String? orderTime;
  String? amount;
  String? entryDate;
  String? service;

  UserInfo(
      {this.userId,
        this.driverId,
        this.pickUpLocation,
        this.dropOfLocation,
        this.bookingType,
        this.isDeleted,
        this.orderDate,
        this.orderTime,
        this.amount,
        this.entryDate,
        this.service});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    driverId = json['driver_id'];
    pickUpLocation = json['pick_up_location'];
    dropOfLocation = json['drop_of_location'];
    bookingType = json['booking_type'];
    isDeleted = json['is_deleted'];
    orderDate = json['order_date'];
    orderTime = json['order_time'];
    amount = json['amount'];
    entryDate = json['entry_date'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['driver_id'] = this.driverId;
    data['pick_up_location'] = this.pickUpLocation;
    data['drop_of_location'] = this.dropOfLocation;
    data['booking_type'] = this.bookingType;
    data['is_deleted'] = this.isDeleted;
    data['order_date'] = this.orderDate;
    data['order_time'] = this.orderTime;
    data['amount'] = this.amount;
    data['entry_date'] = this.entryDate;
    data['service'] = this.service;
    return data;
  }
}