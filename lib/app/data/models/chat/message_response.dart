class MessageResponse {
  bool? success;
  String? message;
  late List<Message> data;
  late List<dynamic> errors;
  Meta? meta;

  MessageResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.data = json["data"] == null
        ? []
        : (json["data"] as List).map((e) => Message.fromJson(e)).toList();
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

class Message {
  int? id;
  String? message;
  bool? isRead;
  String? sentAt;
  int? sender;
  int? receiver;

  Message(
      {this.id,
      this.message,
      this.isRead,
      this.sentAt,
      this.sender,
      this.receiver});

  Message.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.message = json["message"];
    this.isRead = json["is_read"];
    this.sentAt = json["sent_at"];
    this.sender = json["sender"];
    this.receiver = json["receiver"];
  }
}
