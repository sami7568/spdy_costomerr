class UserCreditCardResponse {
  List<Cards>? cards;
  UserInfo? userInfo;
  String? msg;
  int? status;

  UserCreditCardResponse({this.cards, this.userInfo, this.msg, this.status});

  UserCreditCardResponse.fromJson(Map<String, dynamic> json) {
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(new Cards.fromJson(v));
      });
    }
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v.toJson()).toList();
    }
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Cards {
  String? rowId;
  String? userId;
  String? cardName;
  String? cardNumber;
  String? digitNumber;
  String? regDate;
  String? isDeleted;
  String? expiration;

  Cards(
      {this.rowId,
        this.userId,
        this.cardName,
        this.cardNumber,
        this.digitNumber,
        this.regDate,
        this.isDeleted,
        this.expiration});

  Cards.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    userId = json['user_id'];
    cardName = json['card_name'];
    cardNumber = json['card_number'];
    digitNumber = json['digit_number'];
    regDate = json['reg_date'];
    isDeleted = json['is_deleted'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['user_id'] = this.userId;
    data['card_name'] = this.cardName;
    data['card_number'] = this.cardNumber;
    data['digit_number'] = this.digitNumber;
    data['reg_date'] = this.regDate;
    data['is_deleted'] = this.isDeleted;
    data['expiration'] = this.expiration;
    return data;
  }
}

class UserInfo {
  List<Cards>? cards;

  UserInfo({this.cards});

  UserInfo.fromJson(Map<String, dynamic> json) {
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(new Cards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}