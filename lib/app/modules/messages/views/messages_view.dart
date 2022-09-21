import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/app_controller.dart';
import 'package:owner_app/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:owner_app/app/modules/tenant_list/controllers/tenant_list_controller.dart';
import 'package:owner_app/app/routes/app_pages.dart';
import 'package:owner_app/app/widgets/custom_buttom.dart';
import 'package:owner_app/app/widgets/error_page.dart';

import '../../../data/models/chat/chat_response.dart';
import '../../../utils/constants.dart';
import '../../../utils/time_ago.dart';
import '../../../widgets/loading.dart';
import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  String getName({required int sender, required int receiver}) {
    print(sender);
    print(receiver);
    if (sender == Get.find<AppController>().profile?.id) {
      return Get.find<TenantListController>()
              .tenants
              .firstWhereOrNull((element) => element.tenant == receiver)
              ?.firstName ??
          '';
    } else {
      return Get.find<TenantListController>()
              .tenants
              .firstWhereOrNull((element) => element.tenant == sender)
              ?.firstName ??
          '';
    }
  }

  String getMessage(Chat chat) {
    if (chat.sender == Get.find<AppController>().profile?.id) {
      return "You: ${chat.message}";
    } else {
      return chat.message ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Loading()
              : controller.isError.isTrue
                  ? ErrorPage(controller.errorMessage, controller.getChat)
                  : controller.chat.isEmpty
                      ? Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('You got no messages.'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: CustomButton(
                                'New Message',
                                () {
                                  Get.find<NavigationController>()
                                      .changeIndex(3);
                                },
                              ),
                            )
                          ],
                        ))
                      : RefreshIndicator(
                          onRefresh: controller.getChat,
                          child: ListView.builder(
                              itemCount: controller.chat.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.CHAT);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.circular(12),
                                        border: controller.chat[index].isRead ==
                                                false
                                            ? Border.all(color: kPrimaryColor)
                                            : null,
                                        boxShadow: [
                                          BoxShadow(
                                              color: kPrimaryColor
                                                  .withOpacity(0.25),
                                              spreadRadius: 5,
                                              offset: const Offset(0, 3),
                                              blurRadius: 10)
                                        ]),
                                    margin: EdgeInsets.fromLTRB(
                                        10,
                                        index == 0 ? 15 : 10,
                                        10,
                                        index == controller.chat.length - 1
                                            ? 20
                                            : 10),
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.account_circle,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getName(
                                                    sender: controller
                                                            .chat[index]
                                                            .sender ??
                                                        0,
                                                    receiver: controller
                                                            .chat[index]
                                                            .receiver ??
                                                        0),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: controller
                                                                .chat[index]
                                                                .isRead ==
                                                            true
                                                        ? FontWeight.w500
                                                        : FontWeight.bold),
                                              ),
                                              Text(
                                                getMessage(
                                                    controller.chat[index]),
                                                style: TextStyle(
                                                    fontWeight: controller
                                                                .chat[index]
                                                                .isRead ==
                                                            true
                                                        ? FontWeight.normal
                                                        : FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          convertToAgo(DateTime.parse(
                                              controller.chat[index].sentAt ??
                                                  '')),
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
        ));
  }
}
