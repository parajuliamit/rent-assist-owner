import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app_repository.dart';
import '../../../../data/exception/server_exception.dart';
import '../../../../data/models/auth/login_request.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';
import '../views/widgets/login_bottom_sheet.dart';

class LoginController extends GetxController {
  final authRepo = Get.find<AppRepository>().getAuthRepository();
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
      try {
        await authRepo.login(LoginRequest(username: email, password: password));
        Get.offAllNamed(Routes.HOME);
        showSnackbar('Login Successful');
      } catch (e) {
        print(e);
        if (e is DioError) {
          handleError(e);
        } else {
          showSnackbar(e.toString(), isBottom: false, isError: true);
        }
      }
    }

    isLoading(false);
  }

  bool validateInput(String email, String password) {
    bool isValid = true;
    // if (!email.isEmail) {
    //   emailError("Enter a valid email");
    //   isValid = false;
    // }
    // if (password.length < 8) {
    //   passwordError("Password must be at least 8 characters");
    //   isValid = false;
    // }
    return isValid;
  }

  void handleError(DioError e) {
    var error = ServerError.withError(error: e).getError();
    print(error);
    if (error != null) {
      if (error.containsKey('non_field_errors')) {
        showSnackbar(error['non_field_errors']![0], isError: true);
      }
    } else {
      showSnackbar(ServerError.withError(error: e).getErrorMessage(),
          isError: true);
    }
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
