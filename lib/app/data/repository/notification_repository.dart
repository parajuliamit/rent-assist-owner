import 'package:dio/dio.dart';

import '../api/user/user_api.dart';
import '../models/notifications/notification_response.dart';

class NotificationRepository {
  final Dio _dio;

  NotificationRepository(this._dio);

  Future<List<Notification>> getNotifications() async {
    return (await UserApi(_dio).getNotifications()).notifications;
  }
}
