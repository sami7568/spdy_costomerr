class DeleteCreditCardResponse {
  String? msg;
  int? status;

  DeleteCreditCardResponse({this.msg, this.status});

  DeleteCreditCardResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}