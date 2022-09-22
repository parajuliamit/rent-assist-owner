import 'package:get/get.dart';

import '../controllers/tenant_details_controller.dart';

class TenantDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TenantDetailsController>(
      () => TenantDetailsController(),
    );
  }
}
