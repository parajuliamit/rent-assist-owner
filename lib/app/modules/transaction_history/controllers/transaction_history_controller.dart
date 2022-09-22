import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/data/models/transaction/transaction_list.dart';

import '../../../data/exception/server_exception.dart';

class TransactionHistoryController extends GetxController {
  final transactionRepo = Get.find<AppRepository>().getTransactionRepository();
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = '';

  List<Transaction> transactions = [];

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    isLoading.value = true;
    isError.value = false;

    try {
      var response = await transactionRepo.getTransactions();
      transactions = response.reversed.toList();
    } catch (e) {
      isError.value = true;
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
      }
    }

    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
