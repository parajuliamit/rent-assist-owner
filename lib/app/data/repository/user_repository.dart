import 'dart:io';

import 'package:dio/dio.dart';
import 'package:owner_app/app/data/api/user/user_api.dart';
import 'package:owner_app/app/data/models/user/add_tenant_response.dart';
import 'package:owner_app/app/data/models/user/tenant.dart';

import '../models/user/profile.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<Profile?> getUserProfile() async {
    return (await UserApi(_dio).getProfile()).data;
  }

  Future<List<Tenant>> getTenants() async {
    return await UserApi(_dio).getTenants();
  }

  Future<AddTenantResponse> addTenant(
      AddTenantRequest request, File? image, int? owner) async {
    String? fileName = image?.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": image == null
          ? ''
          : await MultipartFile.fromFile(image.path, filename: fileName),
      "price": request.price,
      "internet_price": request.internetPrice ?? 0,
      "water_usage_price": request.waterUsagePrice ?? 0,
      "nagarpalika_fohr_price": request.nagarpalikaFohrPrice ?? 0,
      "electricity_rate": request.electricityRate ?? 0,
      "owner": owner
    });
    var result = await _dio.post('/api/rooms/', data: formData);
    return AddTenantResponse.fromJson(result.data);
  }
}
