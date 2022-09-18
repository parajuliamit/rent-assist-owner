class ProfileResponse {
  bool? success;
  String? message;
  Profile? data;
  late List<dynamic> errors;
  Meta? meta;

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) this.success = json["success"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is Map)
      this.data = json["data"] == null ? null : Profile.fromJson(json["data"]);
    if (json["errors"] is List) this.errors = json["errors"] ?? [];
    if (json["meta"] is Map)
      this.meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
  }
}

class Meta {
  Meta();

  Meta.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}

class Profile {
  int? id;
  String? email;
  bool? isActive;
  bool? isOwner;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  dynamic image;

  Profile({
    this.id,
    this.email,
    this.isActive,
    this.isOwner,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.image,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["email"] is String) this.email = json["email"];
    if (json["is_active"] is bool) this.isActive = json["is_active"];
    if (json["is_owner"] is bool) this.isOwner = json["is_owner"];
    if (json["phone_number"] is String) this.phoneNumber = json["phone_number"];
    if (json["first_name"] is String) this.firstName = json["first_name"];
    if (json["last_name"] is String) this.lastName = json["last_name"];
    this.image = json["image"];
    if (json["user_permissions"] is List) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["email"] = this.email;
    data["is_active"] = this.isActive;
    data["is_owner"] = this.isOwner;
    data["phone_number"] = this.phoneNumber;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["image"] = this.image;
    return data;
  }
}
