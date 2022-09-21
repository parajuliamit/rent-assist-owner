import 'package:get/get.dart';

import '../controllers/balance_viewpage_controller.dart';

class BalanceViewpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BalanceViewpageController>(
      () => BalanceViewpageController(),
    );
  }
}
