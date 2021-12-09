class UserBookingListResponse {
  List<Bookings>? bookings;
  String? msg;
  int? status;

  UserBookingListResponse({this.bookings, this.msg, this.status});

  UserBookingListResponse.fromJson(Map<String, dynamic> json) {
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(Bookings.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['user_id'] = userId;
    data['driver_id'] = driverId;
    data['pick_up_location'] = pickUpLocation;
    data['drop_of_location'] = dropOfLocation;
    data['booking_type'] = bookingType;
    data['order_date'] = orderDate;
    data['order_time'] = orderTime;
    data['amount'] = amount;
    data['entry_date'] = entryDate;
    data['service'] = service;
    data['booking_status'] = bookingStatus;
    data['driver_rating'] = driverRating;
    data['is_deleted'] = isDeleted;
    data['driver_name'] = driverName;
    data['driver_email'] = driverEmail;
    data['cell_number'] = cellNumber;
    return data;
  }
}