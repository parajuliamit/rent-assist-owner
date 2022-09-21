import 'package:get/get.dart';
import 'package:owner_app/app/data/models/user/add_tenant_response.dart';

class QrPageController extends GetxController {
  late final AddTenantResponse addTenantResponse;

  @override
  void onInit() {
    super.onInit();
    addTenantResponse = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
