import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/complaints/edit_complaint_request.dart';
import 'package:owner_app/app/data/models/user/agreement_response.dart';
import 'package:owner_app/app/data/models/user/document_response.dart';
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

  @PATCH("/api/complaints/{id}/")
  Future<void> editComplaint(
      @Path("id") String id, @Body() EditComplaintRequest editComplaintRequest);

  @DELETE("/api/users/my-tenants/{id}")
  Future<void> deleteTenant(@Path("id") String id);

  @GET("/api/notifications/notification/")
  Future<NotificationResponse> getNotifications();

  @GET("/api/users/my-tenants/")
  Future<List<Tenant>> getTenants();

  @GET("/api/contract/agreement/")
  Future<AgreementResponse> getAgreements();

  @GET("/api/contract/documents/")
  Future<List<DocumentResponse>> getDocuments();
}
