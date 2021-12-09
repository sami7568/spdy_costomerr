class EditCreditCardResponse {
  UserInfo? userInfo;
  String? msg;
  int? status;

  EditCreditCardResponse({this.userInfo, this.msg, this.status});

  EditCreditCardResponse.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_name'] = cardName;
    data['card_number'] = cardNumber;
    data['expiration'] = expiration;
    data['digit_number'] = digitNumber;
    return data;
  }
}