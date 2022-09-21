import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/complaints/edit_complaint_request.dart';

import '../api/user/user_api.dart';
import '../models/complaints/complaints_response.dart';

class ComplaintRepository {
  final Dio _dio;

  ComplaintRepository(this._dio);

  Future<List<Complaint>> getComplaints() async {
    return (await UserApi(_dio).getComplaints()).complaints;
  }

  Future<void> editComplaint(
      String id, EditComplaintRequest editComplaintRequest) async {
    return await UserApi(_dio).editComplaint(id, editComplaintRequest);
  }
}
