class MessageRequest {
  int receiver;
  String message;

  MessageRequest({required this.receiver, required this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["receiver"] = this.receiver;
    data["message"] = this.message;
    return data;
  }
}
