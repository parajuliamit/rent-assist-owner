import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';
import 'package:owner_app/app/data/models/user/document_response.dart';
import 'package:owner_app/app/data/models/user/tenant.dart';
import 'package:owner_app/app/modules/tenant_list/controllers/tenant_list_controller.dart';
import 'package:owner_app/app/utils/app_utils.dart';

import '../../../data/models/user/agreement_response.dart';

class TenantDetailsController extends GetxController {
  final userRepo = Get.find<AppRepository>().getUserRepository();

  late final String name;
  late final int id;

  late final Tenant tenant;

  Agreement? agreement;
  DocumentResponse? document;

  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    name = Get.parameters['name']!;
    id = int.parse(Get.parameters['id']!);
    tenant = Get.find<TenantListController>()
        .tenants
        .firstWhere((element) => element.tenant == id);
    getDetails();
  }

  Future<void> getDetails() async {
    isLoading.value = true;
    isError.value = false;
    try {
      agreement = (await userRepo.getAgreements())
          .firstWhere((element) => element.tenant == tenant.id);
      getDocument();
    } catch (e) {
      isError.value = true;
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
    }
    isLoading.value = false;
  }

  void getDocument() async {
    try {
      var response = await userRepo.getDocuments();
      document =
          response.firstWhereOrNull((element) => element.user == tenant.tenant);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTenant() async {
    isLoading.value = true;
    isError.value = false;
    try {
      await userRepo.deleteTenant(tenant.id!.toString());
      Get.find<TenantListController>().getTenants();
      Get.back();
      showSnackbar('Tenant deleted successfully');
    } catch (e) {
      isError.value = true;
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
    }
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
