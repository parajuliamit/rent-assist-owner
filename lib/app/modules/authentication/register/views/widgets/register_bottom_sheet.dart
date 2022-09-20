import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_utils.dart';
import '../../../../../utils/constants.dart';
import '../../../../../widgets/custom_buttom.dart';
import '../../../../../widgets/input_field.dart';
import '../../../../../widgets/loading.dart';
import '../../../../../widgets/password_field.dart';
import '../../controllers/register_controller.dart';

class RegisterBottomSheet extends StatelessWidget {
  const RegisterBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => InputField(
                'First name',
                icon: const Icon(
                  Icons.person_outline_outlined,
                ),
                controller: controller.fnameController,
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorMessage: controller.fnameError.value,
              ),
            ),
            Obx(
              () => InputField(
                'Last name',
                icon: const Icon(
                  Icons.person_outline_outlined,
                ),
                controller: controller.lnameController,
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorMessage: controller.lnameError.value,
              ),
            ),
            Obx(
              () => InputField(
                'Email',
                icon: const Icon(
                  Icons.email_outlined,
                ),
                controller: controller.emailController,
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorMessage: controller.emailError.value,
              ),
            ),
            Obx(
              () => InputField(
                'Phone',
                icon: const Icon(
                  Icons.phone,
                ),
                controller: controller.phoneController,
                inputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                errorMessage: controller.phoneError.value,
              ),
            ),
            Obx(
              () => PasswordField(
                'Password',
                controller: controller.passwordController,
                errorMessage: controller.passwordError.value,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => PasswordField(
                'Confirm Password',
                controller: controller.confirmPasswordController,
                errorMessage: controller.confirmPasswordError.value,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: CustomButton(
              'Submit',
              () {
                FocusScope.of(context).unfocus();
                overlayLoading(controller.register);
              },
              fillColor: kWhiteColor,
              textColor: kPrimaryColor,
            )),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an Account?'),
                TextButton(
                    onPressed: () {
                      Get.back();
                      // Get.back();
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
