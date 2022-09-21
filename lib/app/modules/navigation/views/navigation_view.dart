import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/modules/messages/controllers/messages_controller.dart';
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
              Obx(() => BottomBarIcon(
                    icon: Icons.message_outlined,
                    controller: controller,
                    index: 1,
                    icon2: Get.find<MessagesController>().unseenCount.value == 0
                        ? null
                        : Stack(
                            children: [
                              Positioned(
                                top: 4,
                                left: 2,
                                child: Icon(
                                  Icons.message_outlined,
                                  color: controller.selectedIndex.value == 1
                                      ? kPrimaryColor
                                      : Colors.grey,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    Get.find<MessagesController>()
                                        .unseenCount
                                        .value
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  )),
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
  final Widget? icon2;

  const BottomBarIcon(
      {Key? key,
      required this.icon,
      required this.controller,
      required this.index,
      this.icon2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.changeIndex(index);
      },
      icon: icon2 ??
          Icon(
            icon,
            color: controller.selectedIndex.value == index
                ? kPrimaryColor
                : Colors.grey,
          ),
    );
  }
}
