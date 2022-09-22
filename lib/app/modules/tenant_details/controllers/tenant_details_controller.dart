import 'package:get/get.dart';

class TenantDetailsController extends GetxController {
  late final String name;
  late final int id;

  @override
  void onInit() {
    super.onInit();
    name = Get.parameters['name']!;
    id = int.parse(Get.parameters['id']!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
