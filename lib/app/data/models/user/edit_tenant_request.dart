class EditTenantRequest {
  int? tenant;
  int? price;
  int? internetPrice;
  int? waterUsagePrice;
  int? nagarpalikaFohrPrice;
  int? electricityRate;

  EditTenantRequest(
      {this.tenant,
      this.price,
      this.internetPrice,
      this.waterUsagePrice,
      this.nagarpalikaFohrPrice,
      this.electricityRate});

  EditTenantRequest.fromJson(Map<String, dynamic> json) {
    this.tenant = json["tenant"];
    this.price = json["price"];
    this.internetPrice = json["internet_price"];
    this.waterUsagePrice = json["water_usage_price"];
    this.nagarpalikaFohrPrice = json["nagarpalika_fohr_price"];
    this.electricityRate = json["electricity_rate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["tenant"] = this.tenant;
    data["price"] = this.price;
    data["internet_price"] = this.internetPrice;
    data["water_usage_price"] = this.waterUsagePrice;
    data["nagarpalika_fohr_price"] = this.nagarpalikaFohrPrice;
    data["electricity_rate"] = this.electricityRate;
    return data;
  }
}
