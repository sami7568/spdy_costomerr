class AllDrivers {
  List<DriverInfo>? driverInfo;
  String? msg;
  int? status;

  AllDrivers({this.driverInfo, this.msg, this.status});

  AllDrivers.fromJson(Map<String, dynamic> json) {
    if (json['driver_info'] != null) {
      driverInfo = <DriverInfo>[];
      json['driver_info'].forEach((v) {
        driverInfo!.add(DriverInfo.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.driverInfo != null) {
      data['driver_info'] = driverInfo!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class DriverInfo {
  String? driverId;
  String? driverName;
  String? driverEmail;
  String? cellNumber;
  String? password;
  String? licenseNumber;
  String? licenseIssueDate;
  String? licenseExpirationDate;
  String? dateOfBirth;
  String? stateId;
  String? licenseTypeId;
  String? companyId;
  String? bankAccountHolder;
  String? bankAccountNumber;
  String? routingNumber;
  String? bankName;
  String? bankAddress;
  String? towTruckMakeId;
  String? towYear;
  String? towModelId;
  String? towTruckTypeId;
  String? towWeight;
  String? roadsideAssistance;
  String? lastSignin;
  String? signupDate;
  String? isApproved;
  String? loginStatus;
  String? isDeleted;

  DriverInfo(
      {this.driverId,
        this.driverName,
        this.driverEmail,
        this.cellNumber,
        this.password,
        this.licenseNumber,
        this.licenseIssueDate,
        this.licenseExpirationDate,
        this.dateOfBirth,
        this.stateId,
        this.licenseTypeId,
        this.companyId,
        this.bankAccountHolder,
        this.bankAccountNumber,
        this.routingNumber,
        this.bankName,
        this.bankAddress,
        this.towTruckMakeId,
        this.towYear,
        this.towModelId,
        this.towTruckTypeId,
        this.towWeight,
        this.roadsideAssistance,
        this.lastSignin,
        this.signupDate,
        this.isApproved,
        this.loginStatus,
        this.isDeleted});

  DriverInfo.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverEmail = json['driver_email'];
    cellNumber = json['cell_number'];
    password = json['password'];
    licenseNumber = json['license_number'];
    licenseIssueDate = json['license_issue_date'];
    licenseExpirationDate = json['license_expiration_date'];
    dateOfBirth = json['date_of_birth'];
    stateId = json['state_id'];
    licenseTypeId = json['license_type_id'];
    companyId = json['company_id'];
    bankAccountHolder = json['bank_account_holder'];
    bankAccountNumber = json['bank_account_number'];
    routingNumber = json['routing_number'];
    bankName = json['bank_name'];
    bankAddress = json['bank_address'];
    towTruckMakeId = json['tow_truck_make_id'];
    towYear = json['tow_year'];
    towModelId = json['tow_model_id'];
    towTruckTypeId = json['tow_truck_type_id'];
    towWeight = json['tow_weight'];
    roadsideAssistance = json['roadside_assistance'];
    lastSignin = json['last_signin'];
    signupDate = json['signup_date'];
    isApproved = json['is_approved'];
    loginStatus = json['login_status'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_id'] = this.driverId;
    data['driver_name'] = this.driverName;
    data['driver_email'] = this.driverEmail;
    data['cell_number'] = this.cellNumber;
    data['password'] = this.password;
    data['license_number'] = this.licenseNumber;
    data['license_issue_date'] = this.licenseIssueDate;
    data['license_expiration_date'] = this.licenseExpirationDate;
    data['date_of_birth'] = this.dateOfBirth;
    data['state_id'] = this.stateId;
    data['license_type_id'] = this.licenseTypeId;
    data['company_id'] = this.companyId;
    data['bank_account_holder'] = this.bankAccountHolder;
    data['bank_account_number'] = this.bankAccountNumber;
    data['routing_number'] = this.routingNumber;
    data['bank_name'] = this.bankName;
    data['bank_address'] = this.bankAddress;
    data['tow_truck_make_id'] = this.towTruckMakeId;
    data['tow_year'] = this.towYear;
    data['tow_model_id'] = this.towModelId;
    data['tow_truck_type_id'] = this.towTruckTypeId;
    data['tow_weight'] = this.towWeight;
    data['roadside_assistance'] = this.roadsideAssistance;
    data['last_signin'] = this.lastSignin;
    data['signup_date'] = this.signupDate;
    data['is_approved'] = this.isApproved;
    data['login_status'] = this.loginStatus;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}