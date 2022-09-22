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
      body: SafeArea(
        child: Obx(() => controller.isLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(controller.errorMessage, controller.checkBalance)
                : SingleChildScrollView(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        RentDueContainer(),
                        SizedBox(
                          height: 10,
                        ),
                        BalanceContainer()
                      ],
                    ),
                  )),
      ),
    );
  }
}
