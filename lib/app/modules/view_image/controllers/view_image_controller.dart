import 'package:get/get.dart';

class ViewImageController extends GetxController {
  late final String imageUrl;

  @override
  void onInit() {
    super.onInit();
    imageUrl = Get.parameters['imageUrl']!;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
