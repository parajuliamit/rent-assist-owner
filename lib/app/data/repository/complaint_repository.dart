import 'package:dio/dio.dart';

import '../api/user/user_api.dart';
import '../models/complaints/complaints_response.dart';

class ComplaintRepository {
  final Dio _dio;

  ComplaintRepository(this._dio);

  Future<List<Complaint>> getComplaints() async {
    return (await UserApi(_dio).getComplaints()).complaints;
  }
}
