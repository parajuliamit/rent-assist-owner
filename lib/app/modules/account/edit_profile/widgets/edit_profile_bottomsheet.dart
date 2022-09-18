import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/custom_buttom.dart';
import '../../../../widgets/input_field.dart';
import '../../../../widgets/loading.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileBottomSheet extends StatelessWidget {
  const EditProfileBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
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
                inputType: TextInputType.name,
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
                inputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                errorMessage: controller.lnameError.value,
              ),
            ),
            Obx(
              () => InputField(
                'phone',
                icon: const Icon(
                  Icons.phone_outlined,
                ),
                controller: controller.phoneController,
                inputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                errorMessage: controller.phoneError.value,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() => controller.isLoading.isTrue
                ? const Loading(
                    size: 100,
                  )
                : Center(
                    child: CustomButton(
                    'Save',
                    () {
                      controller.editProfile();
                    },
                    fillColor: kPrimaryColor,
                    textColor: kWhiteColor,
                  ))),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
