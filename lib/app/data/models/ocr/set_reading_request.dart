class SetElectricityRequest {
  double currentReading;
  int tenant;

  SetElectricityRequest({required this.currentReading, required this.tenant});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["current_reading"] = this.currentReading;
    data["tenant"] = this.tenant;
    return data;
  }
}
