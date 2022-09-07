import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: kPrimaryColor,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
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
      ),
    );
  }
}
