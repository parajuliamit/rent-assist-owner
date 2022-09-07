import 'package:get/get.dart';

import '../app_repository.dart';

class AppController extends GetxController {
  bool isLoggedIn = false;
  final appRepo = Get.find<AppRepository>();
  // Profile? profile;

  @override
  void onInit() {
    super.onInit();
  }

  // void login(Profile profile) {
  //   this.profile = profile;
  //   isLoggedIn = true;
  // }

  // void logout() {
  //   isLoggedIn = false;
  //   profile = null;
  // }
}
