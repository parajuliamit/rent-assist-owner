import 'package:get/get.dart';

import '../controllers/qr_page_controller.dart';

class QrPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrPageController>(
      () => QrPageController(),
    );
  }
}
