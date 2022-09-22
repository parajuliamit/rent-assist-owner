class AddTenantResponse {
  bool? success;
  String? message;
  AddTenantRequest? data;
  late List<dynamic> errors;
  Meta? meta;

  AddTenantResponse({this.success, this.message, this.data, this.meta});

  AddTenantResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.data =
        json["data"] == null ? null : AddTenantRequest.fromJson(json["data"]);
    this.errors = json["errors"] ?? [];
    this.meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data!.toJson();
    if (this.errors != null) data["errors"] = this.errors;
    if (this.meta != null) data["meta"] = this.meta!.toJson();
    return data;
  }
}

class Meta {
  int? id;

  Meta({this.id});

  Meta.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    return data;
  }
}

class AddTenantRequest {
  // dynamic image;
  int? price;
  int? internetPrice;
  int? waterUsagePrice;
  int? nagarpalikaFohrPrice;
  int? electricityRate;

  AddTenantRequest(
      {this.price,
      this.internetPrice,
      this.waterUsagePrice,
      this.nagarpalikaFohrPrice,
      this.electricityRate});

  AddTenantRequest.fromJson(Map<String, dynamic> json) {
    // this.image = json["image"];
    this.price = json["price"];
    this.internetPrice = json["internet_price"];
    this.waterUsagePrice = json["water_usage_price"];
    this.nagarpalikaFohrPrice = json["nagarpalika_fohr_price"];
    this.electricityRate = json["electricity_rate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["image"] = null;
    data["price"] = this.price;
    data["internet_price"] = this.internetPrice;
    data["water_usage_price"] = this.waterUsagePrice;
    data["nagarpalika_fohr_price"] = this.nagarpalikaFohrPrice;
    data["electricity_rate"] = this.electricityRate;
    return data;
  }
}
