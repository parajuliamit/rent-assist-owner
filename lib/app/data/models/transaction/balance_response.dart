class BalanceResponse {
  bool? success;
  String? message;
  String? name;
  double? amount;

  BalanceResponse({this.success, this.message, this.name, this.amount});

  BalanceResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.name = json["name"];
    this.amount = json["amount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    data["message"] = this.message;
    data["name"] = this.name;
    data["amount"] = this.amount;
    return data;
  }
}
