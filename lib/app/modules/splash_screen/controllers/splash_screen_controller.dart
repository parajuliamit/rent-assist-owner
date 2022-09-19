import 'package:get/get.dart';

import '../../../app_repository.dart';
import '../../../app_controller.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final isError = false.obs;
  final appRepo = Get.find<AppRepository>();
  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getToken();
  }

  Future<void> getToken() async {
    isError(false);
    try {
      if (appRepo.getAuthRepository().checkLogin()) {
        final appController = Get.find<AppController>();
        var profile = await Get.find<AppRepository>()
            .getUserRepository()
            .getUserProfile();
        if (profile?.isOwner != false) {
          Get.offAllNamed(Routes.LOGIN);
          return;
        }
        appController.login(profile!);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        isError(true);
        errorMessage = "Check your internet connection";
      } else {
        Get.offAllNamed(Routes.LOGIN);
        return;
      }
    }
  }

  @override
  void onClose() {}
}
