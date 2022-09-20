import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/utils/constants.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarIcon(icon: Icons.home, controller: controller, index: 0),
              BottomBarIcon(
                  icon: Icons.message, controller: controller, index: 1),
              BottomBarIcon(
                  icon: Icons.attach_money_outlined,
                  controller: controller,
                  index: 2),
              // MaterialButton(
              //   elevation: 0,
              //   minWidth: 10,
              //   padding: const EdgeInsets.all(16),
              //   onPressed: () {
              //     controller.changeIndex(2);
              //   },
              //   child: const Text(
              //     "Balance",
              //     style: TextStyle(
              //         color: kWhiteColor,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16),
              //   ),
              //   color: kPrimaryColor,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20)),
              // ),
              BottomBarIcon(
                  icon: Icons.group, controller: controller, index: 3),
              BottomBarIcon(
                  icon: Icons.person, controller: controller, index: 4),
            ],
          ),
        )),
        body: controller.currentPage,
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  final IconData icon;
  final NavigationController controller;
  final int index;

  const BottomBarIcon(
      {Key? key,
      required this.icon,
      required this.controller,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.changeIndex(index);
      },
      icon: Icon(
        icon,
        color: controller.selectedIndex.value == index
            ? kPrimaryColor
            : Colors.grey,
      ),
    );
  }
}
