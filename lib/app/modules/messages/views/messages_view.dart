import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(
                Icons.account_circle,
                size: 35,
              ),
              title: const Text('Sunil Thapa'),
              subtitle: const Text('You: Hello'),
              trailing: const Text('12:00'),
              onTap: () => Get.toNamed(Routes.CHAT),
            );
          }),
    );
  }
}
