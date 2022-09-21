class EditComplaintRequest {
  String? status;
  bool? isSolved;

  EditComplaintRequest({this.status, this.isSolved});

  EditComplaintRequest.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.isSolved = json["is_solved"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["is_solved"] = this.isSolved;
    return data;
  }
}
