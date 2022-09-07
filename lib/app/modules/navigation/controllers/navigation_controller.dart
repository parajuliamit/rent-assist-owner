import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/modules/balance_status/views/balance_status_view.dart';
import 'package:owner_app/app/modules/tenant_list/views/tenant_list_view.dart';

import '../../account/views/account_view.dart';
import '../../chat/views/chat_view.dart';
import '../../home/views/home_view.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  List<Widget> pages = [
    HomeView(),
    ChatView(),
    BalanceStatusView(),
    TenantListView(),
    AccountView()
  ];

  Widget get currentPage => IndexedStack(
        index: selectedIndex.value,
        children: pages,
      );

  void changeIndex(int index) {
    selectedIndex(index);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
