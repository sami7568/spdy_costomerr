class EditCreditCardResponse {
  UserInfo? userInfo;
  String? msg;
  int? status;

  EditCreditCardResponse({this.userInfo, this.msg, this.status});

  EditCreditCardResponse.fromJson(Map<String, dynamic> json) {
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
  String? cardName;
  String? cardNumber;
  String? expiration;
  String? digitNumber;

  UserInfo({this.cardName, this.cardNumber, this.expiration, this.digitNumber});

  UserInfo.fromJson(Map<String, dynamic> json) {
    cardName = json['card_name'];
    cardNumber = json['card_number'];
    expiration = json['expiration'];
    digitNumber = json['digit_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_name'] = this.cardName;
    data['card_number'] = this.cardNumber;
    data['expiration'] = this.expiration;
    data['digit_number'] = this.digitNumber;
    return data;
  }
}