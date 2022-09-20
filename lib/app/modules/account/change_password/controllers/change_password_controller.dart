import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';
import 'package:owner_app/app/data/models/auth/change_password_request.dart';

import '../../../../app_repository.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';

class ChangePasswordController extends GetxController {
  final authRepo = Get.find<AppRepository>().getAuthRepository();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // final isLoading = false.obs;
  // final isError = false.obs;

  String errorMessage = '';

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
    // isLoading(true);
    String password = passwordController.text.trim();
    String newpassword = newpasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (validateInput(password, newpassword, confirmPassword)) {
      // await Future.delayed(2.seconds);
      try {
        await authRepo.changePassword(ChangePasswordRequest(
            newPassword1: newpassword, newPassword2: confirmPassword));
        Get.back();
        showSnackbar('Password Reset Successful');
        clearText();
      } catch (e) {
        if (e is DioError) {
          handleError(e);
        } else {
          showSnackbar(e.toString(), isBottom: false, isError: true);
        }
      }
    }

    // isLoading(false);
  }

  void handleError(DioError e) {
    var error = ServerError.withError(error: e).getError();
    if (error != null) {
      if (error.containsKey('detail')) {
        showSnackbar(error['detail'], isError: true);
        return;
      }
      if (error.containsKey('non_field_error')) {
        showSnackbar(error['non_Field_error']![0], isError: true);
      }
      if (error.containsKey('new_password2')) {
        confirmPasswordError(error['new_password2']![0]);
      }
      if (error.containsKey('new_password1')) {
        confirmPasswordError(error['new_password1']![0]);
      }
    } else {
      showSnackbar(ServerError.withError(error: e).getErrorMessage(),
          isError: true);
    }
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
