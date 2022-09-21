class ChangePasswordRequest {
  String? newPassword1;
  String? newPassword2;

  ChangePasswordRequest({this.newPassword1, this.newPassword2});

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    this.newPassword1 = json["new_password1"];
    this.newPassword2 = json["new_password2"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["new_password1"] = this.newPassword1;
    data["new_password2"] = this.newPassword2;
    return data;
  }
}
