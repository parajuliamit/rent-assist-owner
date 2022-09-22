import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/balance_status_controller.dart';
import 'widgets/balance.dart';
import 'widgets/rent_due.dart';

class BalanceStatusView extends GetView<BalanceStatusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance'),
      ),
      body: Obx(() => controller.isLoading.isTrue
          ? const Loading()
          : controller.isError.isTrue
              ? ErrorPage(controller.errorMessage, controller.checkBalance)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    RentDueContainer(),
                    SizedBox(
                      height: 30,
                    ),
                    BalanceContainer()
                  ],
                )),
    );
  }
}
