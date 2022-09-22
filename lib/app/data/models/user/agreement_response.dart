class AgreementResponse {
  bool? success;
  String? message;
  late List<Agreement> data;

  AgreementResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.data = json["data"] == null
        ? []
        : (json["data"] as List).map((e) => Agreement.fromJson(e)).toList();
  }
}

class Agreement {
  int? id;
  int? price;
  int? internetPrice;
  int? waterUsagePrice;
  int? nagarpalikaFohrPrice;
  int? electricityRate;
  String? picture;
  String? created;
  String? updated;
  String? deadline;
  int? tenant;

  Agreement(
      {this.id,
      this.price,
      this.internetPrice,
      this.waterUsagePrice,
      this.nagarpalikaFohrPrice,
      this.electricityRate,
      this.picture,
      this.created,
      this.updated,
      this.deadline,
      this.tenant});

  Agreement.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.price = json["price"];
    this.internetPrice = json["internet_price"];
    this.waterUsagePrice = json["water_usage_price"];
    this.nagarpalikaFohrPrice = json["nagarpalika_fohr_price"];
    this.electricityRate = json["electricity_rate"];
    this.picture = json["picture"];
    this.created = json["created"];
    this.updated = json["updated"];
    this.deadline = json["deadline"];
    this.tenant = json["tenant"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["price"] = this.price;
    data["internet_price"] = this.internetPrice;
    data["water_usage_price"] = this.waterUsagePrice;
    data["nagarpalika_fohr_price"] = this.nagarpalikaFohrPrice;
    data["electricity_rate"] = this.electricityRate;
    data["picture"] = this.picture;
    data["created"] = this.created;
    data["updated"] = this.updated;
    data["deadline"] = this.deadline;
    data["tenant"] = this.tenant;
    return data;
  }
}
