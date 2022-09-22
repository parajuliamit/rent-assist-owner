import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/utils/constants.dart';
import 'package:owner_app/app/widgets/error_page.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Obx(() => controller.isError.isTrue
              ? ErrorPage(controller.errorMessage, controller.getToken)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.roofing_outlined,
                      size: 45,
                      color: kWhiteColor,
                    ),
                    Text(
                      'RENT ASSIST',
                      style: TextStyle(fontSize: 35, color: kWhiteColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'OWNER',
                      style: TextStyle(fontSize: 20, color: kWhiteColor),
                    )
                  ],
                )),
        ));
  }
}
