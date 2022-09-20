import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              Get.back();
            },
          ),
        ),
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
                size: 40,
                color: kWhiteColor,
              ),
              Text(
                'RENT ASSIST',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: kWhiteColor),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 60,
                backgroundColor: kWhiteColor,
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
