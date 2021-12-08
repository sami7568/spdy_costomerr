class AddCreditCardResponse {
  CardInfo? cardInfo;
  String? msg;
  int? status;

  AddCreditCardResponse({this.cardInfo, this.msg, this.status});

  AddCreditCardResponse.fromJson(Map<String, dynamic> json) {
    cardInfo = json['card_info'] != null
        ? new CardInfo.fromJson(json['card_info'])
        : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cardInfo != null) {
      data['card_info'] = this.cardInfo!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['card_name'] = this.cardName;
    data['card_number'] = this.cardNumber;
    data['expiration'] = this.expiration;
    data['is_deleted'] = this.isDeleted;
    data['digit_number'] = this.digitNumber;
    data['reg_date'] = this.regDate;
    return data;
  }
}