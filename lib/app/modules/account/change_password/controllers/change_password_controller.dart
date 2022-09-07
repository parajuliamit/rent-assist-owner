import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final isLoading = false.obs;
  late final TextEditingController passwordController;
  late final TextEditingController newpasswordController;
  late final TextEditingController confirmPasswordController;

  final passwordError = ''.obs;
  final newpasswordError = ''.obs;
  final confirmPasswordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    newpasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordController.addListener(() {
      passwordError.value = "";
    });

    newpasswordController.addListener(() {
      newpasswordError.value = "";
    });

    confirmPasswordController.addListener(() {
      confirmPasswordError.value = "";
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> changePassword() async {
    isLoading(true);
    String password = passwordController.text.trim();
    String newpassword = newpasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (validateInput(password, newpassword, confirmPassword)) {
      await Future.delayed(2.seconds);
      showSnackbar('Password Reset Successful');
      Get.toNamed(Routes.HOME);
      clearText();
    }

    isLoading(false);
  }

  bool validateInput(
      String password, String newpassword, String confirmPassword) {
    bool isValid = true;

    if (newpassword.length < 8) {
      newpasswordError("Passowrd must be at least 8 characters long");
      isValid = false;
    }

    if (newpassword != confirmPassword) {
      confirmPasswordError("Password does not match");
      isValid = false;
    }

    return isValid;
  }

  void clearText() {
    passwordController.clear();
    newpasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    newpasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
