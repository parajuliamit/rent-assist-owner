import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/user/tenant.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/complaints/complaints_response.dart';
import '../../models/notifications/notification_response.dart';
import '../../models/user/profile.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET("/api/users/my-details/")
  Future<ProfileResponse> getProfile();

  @GET("/api/complaints/")
  Future<ComplaintsResponse> getComplaints();

  @GET("/api/notifications/notification/")
  Future<NotificationResponse> getNotifications();

  @GET("/api/users/my-tenants/")
  Future<List<Tenant>> getTenants();
}
