import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/utils/app_utils.dart';

import '../../../../widgets/custom_buttom.dart';
import '../../../../widgets/password_field.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<ChangePasswordController>();
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Obx(
                () => PasswordField(
                  'Current Password',
                  controller: controller.passwordController,
                  errorMessage: controller.passwordError.value,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => PasswordField(
                  'New Password',
                  controller: controller.newpasswordController,
                  errorMessage: controller.newpasswordError.value,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => PasswordField(
                  'Confirm New Password',
                  controller: controller.confirmPasswordController,
                  errorMessage: controller.confirmPasswordError.value,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton('Change Passowrd', () {
                overlayLoading(controller.changePassword);
                // controller.clearText();
              })
            ],
          ),
        ),
      ),
    );
  }
}
