import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/utils/constants.dart';

import '../../../utils/time_ago.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(
                    controller.errorMessage, controller.loadNotifications)
                : controller.notifications.isEmpty
                    ? const Center(
                        child: Text('You have no notifications.'),
                      )
                    : RefreshIndicator(
                        onRefresh: controller.loadNotifications,
                        child: ListView.builder(
                          itemCount: controller.notifications.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      controller.notifications[index].isRead ==
                                              false
                                          ? Border.all(color: kPrimaryColor)
                                          : null,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kPrimaryColor.withOpacity(0.25),
                                        spreadRadius: 5,
                                        offset: const Offset(0, 3),
                                        blurRadius: 10)
                                  ]),
                              margin: EdgeInsets.fromLTRB(
                                  10,
                                  index == 0 ? 15 : 10,
                                  10,
                                  index == controller.notifications.length - 1
                                      ? 20
                                      : 10),
                              padding: const EdgeInsets.all(15.0),
                              child: Row(children: [
                                const Icon(
                                  Icons.notifications_outlined,
                                  color: kPrimaryColor,
                                  size: 28,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      controller.notifications[index].title ??
                                          '',
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  convertToAgo(DateTime.parse(
                                      controller.notifications[index].created ??
                                          '')),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ]),
                            );
                          },
                        ),
                      ),
      ),
    );
  }
}
