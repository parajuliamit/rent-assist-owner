import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../account/views/account_view.dart';
import '../../balance_status/views/balance_status_view.dart';
import '../../home/views/home_view.dart';
import '../../messages/views/messages_view.dart';
import '../../tenant_list/views/tenant_list_view.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  List<Widget> pages = [
    HomeView(),
    MessagesView(),
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
