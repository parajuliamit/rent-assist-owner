class LoginResponse {
  late String key;

  LoginResponse({required this.key});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["key"] is String) this.key = json["key"];
  }
}
