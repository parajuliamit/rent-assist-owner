import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/data/models/user/rent_response.dart';

import '../../../app_repository.dart';
import '../../../data/exception/server_exception.dart';

class RentDetailsController extends GetxController {
  final userRepo = Get.find<AppRepository>().getUserRepository();
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = '';

  List<RentResponse> rents = [];

  @override
  void onInit() {
    super.onInit();
    loadRents();
  }

  Future<void> loadRents() async {
    isLoading.value = true;
    isError.value = false;

    try {
      var response = await userRepo.getRent();
      rents = response.reversed.toList();
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
