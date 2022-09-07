import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';
import '../widgets/edit_profile_bottomsheet.dart';

class EditProfileController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final isLoading = false.obs;
  late final TextEditingController fnameController;
  late final TextEditingController lnameController;
  late final TextEditingController emailController;

  final fnameError = ''.obs;
  final lnameError = ''.obs;
  final emailError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fnameController = TextEditingController(text: 'fname');
    lnameController = TextEditingController(text: 'lname');
    emailController = TextEditingController(text: 'email@email.com');

    fnameController.addListener(() {
      fnameError.value = "";
    });
    lnameController.addListener(() {
      lnameError.value = "";
    });

    emailController.addListener(() {
      emailError.value = "";
    });
  }

  @override
  void onReady() {
    super.onReady();
    showEditProfileBottom();
  }

  Future<void> editProfile() async {
    isLoading(true);
    String fname = fnameController.text.trim();
    String lname = lnameController.text.trim();

    String email = emailController.text.trim();
    if (validateInput(
      fname,
      lname,
      email,
    )) {
      await Future.delayed(2.seconds);
      showSnackbar('Edit Successful');
      Get.toNamed(Routes.HOME);
    }

    isLoading(false);
  }

  bool validateInput(String fname, String lname, String email) {
    bool isValid = true;
    if (!email.isEmail) {
      emailError("Enter a valid email");
      isValid = false;
    }

    if (fname.isEmpty) {
      fnameError("Please enter first name");
      isValid = false;
    }
    if (lname.isEmpty) {
      lnameError("Please enter last name");
      isValid = false;
    }
    return isValid;
  }

  void showEditProfileBottom() {
    scaffoldKey.currentState?.showBottomSheet(
        (context) => const EditProfileBottomSheet(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        enableDrag: false);
  }

  @override
  void onClose() {
    super.onClose();
    fnameController.dispose();
    lnameController.dispose();

    emailController.dispose();
  }
}
