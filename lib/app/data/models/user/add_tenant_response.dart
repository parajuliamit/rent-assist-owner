class AddTenantResponse {
  int? id;
  String? image;
  int? price;
  int? internetPrice;
  int? waterUsagePrice;
  int? nagarpalikaFohrPrice;
  int? electricityRate;
  String? created;
  String? updated;
  int? owner;

  AddTenantResponse(
      {this.id,
      this.image,
      this.price,
      this.internetPrice,
      this.waterUsagePrice,
      this.nagarpalikaFohrPrice,
      this.electricityRate,
      this.created,
      this.updated,
      this.owner});

  AddTenantResponse.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.image = json["image"];
    this.price = json["price"];
    this.internetPrice = json["internet_price"];
    this.waterUsagePrice = json["water_usage_price"];
    this.nagarpalikaFohrPrice = json["nagarpalika_fohr_price"];
    this.electricityRate = json["electricity_rate"];
    this.created = json["created"];
    this.updated = json["updated"];
    this.owner = json["owner"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["image"] = this.image;
    data["price"] = this.price;
    data["internet_price"] = this.internetPrice;
    data["water_usage_price"] = this.waterUsagePrice;
    data["nagarpalika_fohr_price"] = this.nagarpalikaFohrPrice;
    data["electricity_rate"] = this.electricityRate;
    data["created"] = this.created;
    data["updated"] = this.updated;
    data["owner"] = this.owner;
    return data;
  }
}
