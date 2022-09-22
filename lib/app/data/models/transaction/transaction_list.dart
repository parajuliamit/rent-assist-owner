class TransactionList {
  bool? success;
  String? message;
  late List<Transaction> transaction;

  TransactionList.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.transaction = json["data"] == null
        ? []
        : (json["data"] as List).map((e) => Transaction.fromJson(e)).toList();
  }
}

class Transaction {
  int? id;
  String? amount;
  String? medium;
  String? paidAt;
  int? initiator;

  Transaction.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.amount = json["amount"];
    this.medium = json["medium"];
    this.paidAt = json["paid_at"];
    this.initiator = json["initiator"];
  }
}
