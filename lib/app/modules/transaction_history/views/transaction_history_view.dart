import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaction History'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Loading()
              : controller.isError.isTrue
                  ? ErrorPage(
                      controller.errorMessage, controller.loadTransactions)
                  : controller.transactions.isEmpty
                      ? const Center(
                          child: Text(
                            'No transactions yet',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.transactions.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.money,
                                  color: kPrimaryColor,
                                ),
                                title: Text(
                                    'You received Rs ${controller.transactions[index].amount} on ${DateFormat.yMMMd('en_US').format(DateTime.parse(controller.transactions[index].paidAt!))}.'),
                              ),
                            );
                          },
                        ),
        ));
  }
}
