class OcrResponse {
  bool? success;
  String? message;
  double? data;
  late List<dynamic> errors;
  Meta? meta;

  OcrResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.data = json["data"];
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
