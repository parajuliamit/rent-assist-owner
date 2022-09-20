import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';
import 'package:owner_app/app/data/models/user/tenant.dart';

class TenantListController extends GetxController {
  List<Tenant> tenants = [];
  final userRepo = Get.find<AppRepository>().getUserRepository();

  final isLoading = false.obs;
  final isError = false.obs;
  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    getTenants();
  }

  Future<void> getTenants() async {
    isLoading(true);
    isError(false);
    try {
      tenants = await userRepo.getTenants();
    } catch (e) {
      isError(true);
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
    }
    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
