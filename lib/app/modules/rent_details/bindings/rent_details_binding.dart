import 'package:get/get.dart';

import '../controllers/rent_details_controller.dart';

class RentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentDetailsController>(
      () => RentDetailsController(),
    );
  }
}
