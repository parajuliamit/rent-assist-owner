import 'package:get/get.dart';

import '../controllers/choose_tenant_controller.dart';

class ChooseTenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseTenantController>(
      () => ChooseTenantController(),
    );
  }
}
