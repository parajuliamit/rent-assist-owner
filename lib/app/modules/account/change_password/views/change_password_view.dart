import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/custom_buttom.dart';
import '../../../../widgets/password_field.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<ChangePasswordController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => PasswordField(
                    'Curent password',
                    controller: controller.passwordController,
                    errorMessage: controller.passwordError.value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => PasswordField(
                    'New password',
                    controller: controller.newpasswordController,
                    errorMessage: controller.newpasswordError.value,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => PasswordField(
                    'Confirm new password',
                    controller: controller.confirmPasswordController,
                    errorMessage: controller.confirmPasswordError.value,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton('Update password', () {
                  controller.changePassword();
                  // controller.clearText();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
