import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app_repository.dart';
import 'data/models/user/profile.dart';
import 'utils/constants.dart';

class AppController extends GetxController {
  bool isLoggedIn = false;
  final appRepo = Get.find<AppRepository>();
  Profile? profile;

  late FirebaseMessaging messaging;

  @override
  void onInit() {
    super.onInit();
    messaging = FirebaseMessaging.instance;
    messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    messaging.subscribeToTopic('all');
    messaging.subscribeToTopic('owner');
    checkForInitialMessage();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      if (event.notification != null) {
        print(
            'Message title: ${event.notification?.title}, body: ${event.notification?.body}, data: ${event.data}');
        showNotification(event);
      }
    });
  }

  void showNotification(RemoteMessage event) {
    Get.snackbar(
      event.notification!.title ?? '',
      event.notification!.body ?? '',
      duration: 4.seconds,
      margin: const EdgeInsets.all(10),
      backgroundColor: kPrimaryColor,
      colorText: Colors.white,
      icon: const Padding(
          padding: EdgeInsets.only(left: 5),
          child:
              Icon(Icons.notifications_active_outlined, color: Colors.white)),
    );
  }

  checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print('Initial message: ${initialMessage.data}');
      //   if (initialMessage.data.containsKey('eventId')) {
      //     // Get.toNamed(Routes.EVENT_DETAIL, parameters: {
      //     //   'id': initialMessage.data['eventId'],
      //     // });
      //   }
    }
  }

  void login(Profile profile) {
    this.profile = profile;
    isLoggedIn = true;
  }

  // void logout() {
  //   isLoggedIn = false;
  //   profile = null;
  // }
}
