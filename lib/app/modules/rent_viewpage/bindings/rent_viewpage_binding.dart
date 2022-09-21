import 'package:get/get.dart';

import '../controllers/rent_viewpage_controller.dart';

class RentViewpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentViewpageController>(
      () => RentViewpageController(),
    );
  }
}
