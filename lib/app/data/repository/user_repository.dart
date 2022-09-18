import 'package:dio/dio.dart';
import 'package:owner_app/app/data/api/user/user_api.dart';

import '../models/user/profile.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);
  Future<Profile?> getUserProfile() async {
    return (await UserApi(_dio).getProfile()).data;
  }
}
