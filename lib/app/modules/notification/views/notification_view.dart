import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/time_ago.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notifications'),
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
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                leading: const Icon(Icons.notifications),
                                title: Text(
                                    controller.notifications[index].title ??
                                        ''),
                                trailing: const Icon(Icons.chevron_right),
                                subtitle: Text(convertToAgo(DateTime.parse(
                                    controller.notifications[index].created ??
                                        ''))),
                              ),
                            );
                          },
                        ),
                      ),
      ),
    );
  }
}
