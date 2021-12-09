class AddCreditCardResponse {
  CardInfo? cardInfo;
  String? msg;
  int? status;

  AddCreditCardResponse({this.cardInfo, this.msg, this.status});

  AddCreditCardResponse.fromJson(Map<String, dynamic> json) {
    cardInfo = json['card_info'] != null
        ? CardInfo.fromJson(json['card_info'])
        : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (cardInfo != null) {
      data['card_info'] = cardInfo!.toJson();
    }
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class CardInfo {
  String? userId;
  String? cardName;
  String? cardNumber;
  String? expiration;
  int? isDeleted;
  String? digitNumber;
  String? regDate;

  CardInfo(
      {this.userId,
        this.cardName,
        this.cardNumber,
        this.expiration,
        this.isDeleted,
        this.digitNumber,
        this.regDate});

  CardInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    cardName = json['card_name'];
    cardNumber = json['card_number'];
    expiration = json['expiration'];
    isDeleted = json['is_deleted'];
    digitNumber = json['digit_number'];
    regDate = json['reg_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['card_name'] = cardName;
    data['card_number'] = cardNumber;
    data['expiration'] = expiration;
    data['is_deleted'] = isDeleted;
    data['digit_number'] = digitNumber;
    data['reg_date'] = regDate;
    return data;
  }
}