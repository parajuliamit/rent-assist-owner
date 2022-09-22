class DocumentResponse {
  int? id;
  String? citizenship;
  int? user;

  DocumentResponse({this.id, this.citizenship, this.user});

  DocumentResponse.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.citizenship = json["citizenship"];
    this.user = json["user"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["citizenship"] = this.citizenship;
    data["user"] = this.user;
    return data;
  }
}
