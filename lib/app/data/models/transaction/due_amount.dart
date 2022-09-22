class DueAmount {
  double? dueAmountSum;

  DueAmount({this.dueAmountSum});

  DueAmount.fromJson(Map<String, dynamic> json) {
    this.dueAmountSum = json["due_amount__sum"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["due_amount__sum"] = this.dueAmountSum;
    return data;
  }
}
