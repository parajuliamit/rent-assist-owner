class RegisterRequest {
  String email;
  String password1;
  String password2;
  String firstName;
  String lastName;
  String phoneNumber;

  RegisterRequest(
      {required this.email,
      required this.password1,
      required this.password2,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.email;
    data["email"] = this.email;
    data["password1"] = this.password1;
    data["password2"] = this.password2;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["phone_number"] = this.phoneNumber;
    data["is_owner"] = true;
    return data;
  }
}
