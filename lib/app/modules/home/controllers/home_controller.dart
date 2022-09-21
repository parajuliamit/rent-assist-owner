import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';
import 'package:owner_app/app/utils/app_utils.dart';

import '../../../app_repository.dart';

class HomeController extends GetxController {
  final appRepo = Get.find<AppRepository>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<String?> scanOcr(File file) async {
    try {
      return await appRepo.getOcrRepository().scanOcr(file);
    } catch (e) {
      if (e is DioError) {
        showSnackbar(ServerError.withError(error: e).getErrorMessage(),
            isError: true);
      } else {
        showSnackbar(e.toString(), isError: true);
      }
    }
  }

  @override
  void onClose() {}
}
