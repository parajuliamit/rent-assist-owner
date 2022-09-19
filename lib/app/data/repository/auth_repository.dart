import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../app_repository.dart';
import '../../app_controller.dart';
import '../api/auth/auth_api.dart';
import '../api/auth/register_request.dart';
import '../models/auth/login_request.dart';

class AuthRepository {
  final GetStorage _storage;
  final Dio _dio;

  AuthRepository(this._storage, this._dio);

  Future<void> login(LoginRequest loginRequest) async {
    var response = await AuthApi(_dio).login(loginRequest);
    _storage.write('token', response.key);
    final appController = Get.find<AppController>();
    var profile =
        await Get.find<AppRepository>().getUserRepository().getUserProfile();
    if (profile?.isOwner != false) {
      throw Exception('You are not a tenant');
    }
    appController.login(profile!);
  }

  bool checkLogin() {
    String? token = _storage.read("token");
    if (token == null || token == '') {
      return false;
    }
    return true;
  }

  // void logout() {
  //   LoginResponseCache(_sharedPreferences).delete();
  // }

  // Future<LoginResponse?> getCacheResponse() async {
  //   return await LoginResponseCache(this._sharedPreferences).get();
  // }

  Future<void> registerUser(RegisterRequest registerRequest) async {
    // LoginResponse loginResponse;

    await AuthApi(_dio).register(registerRequest);

    // LoginResponseCache(_sharedPreferences).set(loginResponse);
    // return loginResponse;
  }

  // Future<void> verifyOtp(VerifyOtp verifyOtp) async {
  //   await AuthApi(_dio).verify(verifyOtp);
  // }

  // Future<void> resendOtp(String userId) async {
  //   await AuthApi(_dio).resendOtp(userId);
  // }
}
