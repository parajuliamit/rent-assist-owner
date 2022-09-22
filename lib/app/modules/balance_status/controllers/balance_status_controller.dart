import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/utils/app_utils.dart';

import '../../../app_repository.dart';
import '../../../data/exception/server_exception.dart';

class BalanceStatusController extends GetxController {
  final transactionRepo = Get.find<AppRepository>().getTransactionRepository();
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = '';

  int balance = 0;
  int rent = 0;

  @override
  void onInit() {
    super.onInit();
    checkBalance();
  }

  Future<void> checkBalance() async {
    isLoading.value = true;
    isError.value = false;

    try {
      var response = await transactionRepo.getBalance();
      balance = response.amount?.ceil() ?? 0;
      var rentResponse = await transactionRepo.getDueAmount();
      rent = rentResponse.dueAmountSum?.ceil() ?? 0;
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

  Future<void> withdraw() async {
    try {
      await transactionRepo.withdraw();
      checkBalance();
    } catch (e) {
      String error;
      if (e is DioError) {
        error = ServerError.withError(error: e).getErrorMessage();
      } else {
        error = e.toString();
      }
      showSnackbar(error, isError: true);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
