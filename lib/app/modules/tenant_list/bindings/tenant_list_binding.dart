import 'package:get/get.dart';

import '../controllers/tenant_list_controller.dart';

class TenantListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TenantListController>(
      () => TenantListController(),
    );
  }
}
