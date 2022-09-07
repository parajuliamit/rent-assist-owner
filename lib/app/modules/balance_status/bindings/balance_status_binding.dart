import 'package:get/get.dart';

import '../controllers/balance_status_controller.dart';

class BalanceStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BalanceStatusController>(
      () => BalanceStatusController(),
    );
  }
}
