class CreateAgreementRequest {
  int tenant;
  int price;
  int internetPrice;
  int waterUsagePrice;
  int nagarpalikaFohrPrice;
  int electricityRate;

  CreateAgreementRequest(
      {required this.tenant,
      required this.price,
      required this.internetPrice,
      required this.waterUsagePrice,
      required this.nagarpalikaFohrPrice,
      required this.electricityRate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["tenant"] = this.tenant;
    data["picture"] = null;
    data["price"] = this.price;
    data["internet_price"] = this.internetPrice;
    data["water_usage_price"] = this.waterUsagePrice;
    data["nagarpalika_fohr_price"] = this.nagarpalikaFohrPrice;
    data["electricity_rate"] = this.electricityRate;
    return data;
  }
}
