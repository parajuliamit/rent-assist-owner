class RentResponse {
  int? id;
  String? thisMonthRent;
  String? amountToBePaid;
  String? amountPaidThisMonth;
  String? dueAmount;
  String? status;
  String? paidAt;
  String? nextPaymentSchedule;
  int? tenant;

  RentResponse(
      {this.id,
      this.thisMonthRent,
      this.amountToBePaid,
      this.amountPaidThisMonth,
      this.dueAmount,
      this.status,
      this.paidAt,
      this.nextPaymentSchedule,
      this.tenant});

  RentResponse.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.thisMonthRent = json["this_month_rent"];
    this.amountToBePaid = json["amount_to_be_paid"];
    this.amountPaidThisMonth = json["amount_paid_this_month"];
    this.dueAmount = json["due_amount"];
    this.status = json["status"];
    this.paidAt = json["paid_at"];
    this.nextPaymentSchedule = json["next_payment_schedule"];
    this.tenant = json["tenant"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["this_month_rent"] = this.thisMonthRent;
    data["amount_to_be_paid"] = this.amountToBePaid;
    data["amount_paid_this_month"] = this.amountPaidThisMonth;
    data["due_amount"] = this.dueAmount;
    data["status"] = this.status;
    data["paid_at"] = this.paidAt;
    data["next_payment_schedule"] = this.nextPaymentSchedule;
    data["tenant"] = this.tenant;
    return data;
  }
}
