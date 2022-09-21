import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../utils/constants.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: kPrimaryColor)),
      onPressed: () {
        Get.find<AppRepository>().getAuthRepository().logout();
        Get.offAllNamed(Routes.LOGIN);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Stack(
          children: const [
            Center(
              child: Text(
                'Logout',
                style: TextStyle(color: kWhiteColor, fontSize: 17),
              ),
            ),
            Icon(
              Icons.logout,
              color: kWhiteColor,
            )
          ],
        ),
      ),
      color: kPrimaryColor,
      elevation: 0,
    );
  }
}
