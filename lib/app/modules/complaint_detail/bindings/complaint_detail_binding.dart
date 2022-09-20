import 'package:get/get.dart';

import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintDetailController>(
      () => ComplaintDetailController(),
    );
  }
}
