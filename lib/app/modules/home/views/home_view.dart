import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:owner_app/app/modules/complaint/controllers/complaint_controller.dart';
import 'package:owner_app/app/modules/home/views/widgets/scan_meter_container.dart';
import 'package:owner_app/app/modules/home/views/widgets/icon_container.dart';
import 'package:owner_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:owner_app/app/modules/tenant_list/controllers/tenant_list_controller.dart';
import 'package:owner_app/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../utils/constants.dart';
import '../../../widgets/loading.dart';
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
                    child: Obx(() => ComplaintContainer(
                          title: Get.find<ComplaintController>()
                              .pendingComplaints
                              .value
                              .toString(),
                          subtitle: 'Complaints',
                          onTap: () {
                            Get.toNamed(Routes.COMPLAINT);
                          },
                        )),
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
                    child: Obx(
                      () => IconContainer(
                          onTap: () {
                            Get.toNamed(Routes.NOTIFICATION);
                          },
                          title: 'Notifications',
                          icon: Icons.notifications_active_outlined,
                          icon2: Stack(
                            children: [
                              const Icon(
                                Icons.notifications_active_outlined,
                                color: kPrimaryColor,
                                size: 40,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    Get.find<NotificationController>()
                                        .unreadCount
                                        .value
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )),
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
            ScanMeterContainer(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('History',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    onTap: () {
                      Get.toNamed(Routes.TRANSACTION_HISTORY);
                    },
                  )
                ],
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
                child: Obx(
                  () {
                    final historyController =
                        Get.find<TransactionHistoryController>();
                    return historyController.isLoading.isTrue
                        ? const Loading()
                        : historyController.transactions.isEmpty
                            ? const Center(child: Text('No Transactions'))
                            : ListView.builder(
                                itemCount:
                                    historyController.transactions.length > 5
                                        ? 5
                                        : historyController.transactions.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        child: Row(
                                          children: [
                                            Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor
                                                        .withOpacity(0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: const Center(
                                                    child: Text(
                                                  'रू',
                                                  style: TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ))),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(() => Text(
                                                        Get.find<TenantListController>()
                                                                .isLoading
                                                                .isTrue
                                                            ? 'Received'
                                                            : "${Get.find<TenantListController>().tenants.firstWhere((element) => element.id == historyController.transactions[index].initiator).firstName} ${Get.find<TenantListController>().tenants.firstWhere((element) => element.id == historyController.transactions[index].initiator).lastName}",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16),
                                                      )),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    DateFormat.yMMMd('en_US')
                                                        .format(DateTime.parse(
                                                            historyController
                                                                .transactions[
                                                                    index]
                                                                .paidAt!)),
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              'रू ${historyController.transactions[index].amount}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider()
                                    ],
                                  );
                                });
                  },
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
