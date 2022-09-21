import 'package:get/get.dart';
import 'package:owner_app/app/modules/balance_status/controllers/balance_status_controller.dart';
import 'package:owner_app/app/modules/tenant_list/controllers/tenant_list_controller.dart';

import '../../account/controllers/account_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../messages/controllers/messages_controller.dart';
import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );

    Get.lazyPut<BalanceStatusController>(
      () => BalanceStatusController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<TenantListController>(
      () => TenantListController(),
    );
  }
}
