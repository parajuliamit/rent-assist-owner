import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';
import '../views/widgets/login_bottom_sheet.dart';

class LoginController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final isLoading = false.obs;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final emailError = "".obs;
  final passwordError = "".obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(() {
      emailError.value = "";
    });
    passwordController.addListener(() {
      passwordError.value = "";
    });
  }

  @override
  void onReady() {
    super.onReady();
    showLoginBottom();
  }

  Future<void> login() async {
    isLoading(true);
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (validateInput(email, password)) {
      await Future.delayed(2.seconds);
      //Login logic here
      showSnackbar('Login Successful');
      Get.offNamed(Routes.HOME);
    }

    isLoading(false);
  }

  bool validateInput(String email, String password) {
    bool isValid = true;
    if (!email.isEmail) {
      emailError("Enter a valid email");
      isValid = false;
    }
    if (password.length < 8) {
      passwordError("Password must be at least 8 characters");
      isValid = false;
    }
    return isValid;
  }

  void showLoginBottom() {
    scaffoldKey.currentState?.showBottomSheet(
        (context) => const LoginBottomSheet(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        enableDrag: false);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
