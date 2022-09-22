import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_controller.dart';
import '../../../../utils/constants.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: kGreyColor,
                radius: 25,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Welcome, ${Get.find<AppController>().profile?.firstName}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
