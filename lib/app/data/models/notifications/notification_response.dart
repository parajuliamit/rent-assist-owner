class NotificationResponse {
  bool? success;
  String? message;
  late List<Notification> notifications;
  late List<dynamic> errors;
  Meta? meta;

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.notifications = json["data"] == null
        ? []
        : (json["data"] as List).map((e) => Notification.fromJson(e)).toList();
    this.errors = json["errors"] ?? [];
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

class Notification {
  int? id;
  String? created;
  String? title;
  String? type;
  int? tenant;

  Notification({this.id, this.created, this.title, this.type, this.tenant});

  Notification.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["created"] is String) this.created = json["created"];
    if (json["title"] is String) this.title = json["title"];
    if (json["type"] is String) this.type = json["type"];
    if (json["tenant"] is int) this.tenant = json["tenant"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["created"] = this.created;
    data["title"] = this.title;
    data["type"] = this.type;
    data["tenant"] = this.tenant;
    return data;
  }
}
