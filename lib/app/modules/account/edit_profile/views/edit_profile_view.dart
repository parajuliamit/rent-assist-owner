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
        key: controller.scaffoldKey,
        backgroundColor: kPrimaryColor,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.roofing_outlined,
                size: 35,
                color: kWhiteColor,
              ),
              const Text(
                'RENT ASSIST',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: kWhiteColor),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    const CircleAvatar(
                      backgroundColor: kWhiteColor,
                      child: Icon(
                        Icons.person,
                        size: 80,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: ClipOval(
                          child: Material(
                            elevation: 20,
                            color: kPrimaryColor,
                            child: InkWell(
                              splashColor: kWhiteColor,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.camera_alt_outlined,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
