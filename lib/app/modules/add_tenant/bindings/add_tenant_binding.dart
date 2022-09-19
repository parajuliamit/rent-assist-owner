import 'package:get/get.dart';

import '../controllers/add_tenant_controller.dart';

class AddTenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTenantController>(
      () => AddTenantController(),
    );
  }
}
