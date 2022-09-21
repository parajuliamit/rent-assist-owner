class ChatResponse {
  bool? success;
  String? message;
  late List<Chat> chat;
  late List<dynamic> errors;
  Meta? meta;

  ChatResponse(
      {this.success,
      this.message,
      required this.chat,
      required this.errors,
      this.meta});

  ChatResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.chat = json["data"] == null
        ? []
        : (json["data"] as List).map((e) => Chat.fromJson(e)).toList();
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

class Chat {
  int? id;
  String? message;
  bool? isRead;
  String? sentAt;
  int? sender;
  int? receiver;

  Chat(
      {this.id,
      this.message,
      this.isRead,
      this.sentAt,
      this.sender,
      this.receiver});

  Chat.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.message = json["message"];
    this.isRead = json["is_read"];
    this.sentAt = json["sent_at"];
    this.sender = json["sender"];
    this.receiver = json["receiver"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["message"] = this.message;
    data["is_read"] = this.isRead;
    data["sent_at"] = this.sentAt;
    data["sender"] = this.sender;
    data["receiver"] = this.receiver;
    return data;
  }
}
