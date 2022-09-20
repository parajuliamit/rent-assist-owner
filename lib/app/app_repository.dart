import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:owner_app/app/data/repository/complaint_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'data/interceptor/authentication_interceptor.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/notification_repository.dart';
import 'data/repository/user_repository.dart';
import 'utils/constants.dart';

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

  ComplaintRepository getComplaintsRepository() {
    return ComplaintRepository(_dioClient);
  }

  NotificationRepository getNotificationRepository() {
    return NotificationRepository(_dioClient);
  }
}
