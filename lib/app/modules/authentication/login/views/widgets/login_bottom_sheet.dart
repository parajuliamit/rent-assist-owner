import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/app_utils.dart';
import '../../../../../utils/constants.dart';
import '../../../../../widgets/custom_buttom.dart';
import '../../../../../widgets/input_field.dart';
import '../../../../../widgets/password_field.dart';
import '../../controllers/login_controller.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(width: 2, color: kWhiteColor),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome Owner',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => PasswordField(
                'Password',
                controller: controller.passwordController,
                errorMessage: controller.passwordError.value,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: kDarkGreyColor,
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              'Login',
              () {
                FocusScope.of(context).unfocus();
                overlayLoading(controller.login);
              },
              fillColor: kWhiteColor,
              textColor: kPrimaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              'Register',
              () {
                Get.toNamed(Routes.REGISTER);
              },
            )
          ],
        ),
      ),
    );
  }
}
