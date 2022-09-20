class ComplaintsResponse {
  bool? success;
  String? message;
  late List<Complaint> complaints;
  late List<dynamic> errors;
  Meta? meta;
  String? messgae;

  ComplaintsResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) this.success = json["success"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is List)
      this.complaints = json["data"] == null
          ? []
          : (json["data"] as List).map((e) => Complaint.fromJson(e)).toList();
    if (json["errors"] is List) this.errors = json["errors"] ?? [];
    if (json["meta"] is Map)
      this.meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    if (json["messgae"] is String) this.messgae = json["messgae"];
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

class Complaint {
  int? id;
  String? image;
  String? title;
  String? description;
  String? date;
  String? urgencyLevel;
  int? tenant;

  Complaint(
      {this.id,
      this.image,
      this.title,
      this.description,
      this.date,
      this.urgencyLevel,
      this.tenant});

  Complaint.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["image"] is String) this.image = json["image"];
    if (json["title"] is String) this.title = json["title"];
    if (json["description"] is String) this.description = json["description"];
    if (json["date"] is String) this.date = json["date"];
    if (json["urgency_level"] is String)
      this.urgencyLevel = json["urgency_level"];
    if (json["tenant"] is int) this.tenant = json["tenant"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["image"] = this.image;
    data["title"] = this.title;
    data["description"] = this.description;
    data["date"] = this.date;
    data["urgency_level"] = this.urgencyLevel;
    data["tenant"] = this.tenant;
    return data;
  }
}
