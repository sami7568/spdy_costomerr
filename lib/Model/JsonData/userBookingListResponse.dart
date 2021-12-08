class UserBookingListResponse {
  List<Bookings>? bookings;
  String? msg;
  int? status;

  UserBookingListResponse({this.bookings, this.msg, this.status});

  UserBookingListResponse.fromJson(Map<String, dynamic> json) {
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Bookings {
  String? bookingId;
  String? userId;
  String? driverId;
  String? pickUpLocation;
  String? dropOfLocation;
  String? bookingType;
  String? orderDate;
  String? orderTime;
  String? amount;
  String? entryDate;
  String? service;
  String? bookingStatus;
  String? driverRating;
  String? isDeleted;
  String? driverName;
  String? driverEmail;
  String? cellNumber;

  Bookings(
      {this.bookingId,
        this.userId,
        this.driverId,
        this.pickUpLocation,
        this.dropOfLocation,
        this.bookingType,
        this.orderDate,
        this.orderTime,
        this.amount,
        this.entryDate,
        this.service,
        this.bookingStatus,
        this.driverRating,
        this.isDeleted,
        this.driverName,
        this.driverEmail,
        this.cellNumber});

  Bookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    userId = json['user_id'];
    driverId = json['driver_id'];
    pickUpLocation = json['pick_up_location'];
    dropOfLocation = json['drop_of_location'];
    bookingType = json['booking_type'];
    orderDate = json['order_date'];
    orderTime = json['order_time'];
    amount = json['amount'];
    entryDate = json['entry_date'];
    service = json['service'];
    bookingStatus = json['booking_status'];
    driverRating = json['driver_rating'];
    isDeleted = json['is_deleted'];
    driverName = json['driver_name'];
    driverEmail = json['driver_email'];
    cellNumber = json['cell_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['user_id'] = this.userId;
    data['driver_id'] = this.driverId;
    data['pick_up_location'] = this.pickUpLocation;
    data['drop_of_location'] = this.dropOfLocation;
    data['booking_type'] = this.bookingType;
    data['order_date'] = this.orderDate;
    data['order_time'] = this.orderTime;
    data['amount'] = this.amount;
    data['entry_date'] = this.entryDate;
    data['service'] = this.service;
    data['booking_status'] = this.bookingStatus;
    data['driver_rating'] = this.driverRating;
    data['is_deleted'] = this.isDeleted;
    data['driver_name'] = this.driverName;
    data['driver_email'] = this.driverEmail;
    data['cell_number'] = this.cellNumber;
    return data;
  }
}