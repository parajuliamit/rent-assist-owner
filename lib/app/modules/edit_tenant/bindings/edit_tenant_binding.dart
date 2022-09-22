import 'package:get/get.dart';

import '../controllers/edit_tenant_controller.dart';

class EditTenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTenantController>(
      () => EditTenantController(),
    );
  }
}
