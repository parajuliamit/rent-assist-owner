class ScanBattiResponse {
  bool? success;
  String? message;
  Data? data;
  double? totalPayableUnitThisMonth;
  double? thisMonthMeterReading;

  ScanBattiResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
    this.totalPayableUnitThisMonth = json["total_payable_unit_this_month"];
    this.thisMonthMeterReading = json["this_month_meter_reading"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    data["message"] = this.message;
    if (this.data != null) data["data"] = this.data!.toJson();
    data["total_payable_unit_this_month"] = this.totalPayableUnitThisMonth;
    data["this_month_meter_reading"] = this.thisMonthMeterReading;
    return data;
  }
}

class Data {
  int? tenant;
  String? currentReading;

  Data({this.tenant, this.currentReading});

  Data.fromJson(Map<String, dynamic> json) {
    this.tenant = json["tenant"];
    this.currentReading = json["current_reading"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["tenant"] = this.tenant;
    data["current_reading"] = this.currentReading;
    return data;
  }
}
