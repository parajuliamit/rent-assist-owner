import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/modules/authentication/register/views/widgets/register_bottom_sheet.dart';
import '../../../../utils/constants.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.scaffoldKey,
      // backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kPrimaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.roofing_outlined,
                    size: 35,
                    color: kWhiteColor,
                  ),
                  Text(
                    'RENT ASSIST',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: kWhiteColor),
                  ),
                ],
              ),
            ),
            Container(
              color: kPrimaryColor,
              child: const ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: RegisterBottomSheet()),
            )
          ],
        ),
      ),
    );
  }
}
