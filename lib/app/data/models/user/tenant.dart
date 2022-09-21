class Tenant {
  int? id;
  int? tenant;
  int? owner;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  Tenant(
      {this.id,
      this.tenant,
      this.owner,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber});

  Tenant.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.tenant = json["tenant"];
    this.owner = json["owner"];
    this.firstName = json["first_name"];
    this.lastName = json["last_name"];
    this.email = json["email"];
    this.phoneNumber = json["phone_number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["tenant"] = this.tenant;
    data["owner"] = this.owner;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["email"] = this.email;
    data["phone_number"] = this.phoneNumber;
    return data;
  }
}
