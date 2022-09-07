import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Tenant this..... has paid rent upto month.....'),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text('2 days ago'),
            ),
          );
        },
      ),
    );
  }
}
