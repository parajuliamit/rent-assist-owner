import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app/data/interceptor/authentication_interceptor.dart';
import 'app/data/repository/auth_repository.dart';
import 'app/data/repository/user_repository.dart';
import 'app/utils/constants.dart';

class AppRepository extends GetxService {
  final Dio _dioClient;
  final GetStorage _storage;

  AppRepository(this._dioClient, this._storage) {
    // Configure dio
    this._dioClient.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );

    this._dioClient.interceptors.add(AuthenticationInterceptor(_storage));

    // For Debugging purpose
    this._dioClient.interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        compact: true));
  }

  AuthRepository getAuthRepository() {
    return AuthRepository(_storage, _dioClient);
  }

  UserRepository getUserRepository() {
    return UserRepository(_dioClient);
  }
}
