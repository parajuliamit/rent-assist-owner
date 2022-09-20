class RegisterDeviceRequest {
  String registrationId;
  String type;

  RegisterDeviceRequest({required this.registrationId, required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["registration_id"] = this.registrationId;
    data["type"] = this.type;
    return data;
  }
}
