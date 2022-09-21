import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/modules/home/views/widgets/scan_meter_container.dart';
import 'package:owner_app/app/modules/home/views/widgets/icon_container.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../utils/constants.dart';
import '../../navigation/controllers/navigation_controller.dart';
import '../controllers/home_controller.dart';
import 'widgets/complaint_container.dart';
import 'widgets/user_info.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const UserInfo(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: IconContainer(
                    onTap: () {
                      Get.find<NavigationController>().changeIndex(3);
                    },
                    icon: Icons.groups,
                    title: 'My Tenants',
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ComplaintContainer(
                      title: '4',
                      subtitle: 'Complaints',
                      onTap: () {
                        Get.toNamed(Routes.COMPLAINT);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: IconContainer(
                      onTap: () {
                        Get.toNamed(Routes.NOTIFICATION);
                      },
                      title: 'Notifications',
                      icon: Icons.notifications_active_outlined,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: IconContainer(
                    onTap: () {
                      Get.find<NavigationController>().changeIndex(2);
                    },
                    icon: Icons.attach_money,
                    title: 'Check Balance',
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ScanBattiContainer(),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: kPrimaryColor.withOpacity(0.25),
                          spreadRadius: 5,
                          offset: const Offset(0, 3),
                          blurRadius: 10)
                    ]),
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: const Text('Rent'),
                        subtitle: const Text('Paid'),
                        trailing: const Text('Rs 5000'),
                      );
                    })),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
