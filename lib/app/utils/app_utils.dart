import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/utils/constants.dart';

import '../widgets/loading.dart';

void showSnackbar(String message,
    {bool isError = false, bool isBottom = false, Duration? time}) async {
  await Get.closeCurrentSnackbar();
  Get.snackbar(
    isError ? 'Error' : 'Success',
    message,
    duration: time ?? const Duration(seconds: 3),
    snackPosition: isBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    colorText: Colors.white,
    isDismissible: true,
    margin: const EdgeInsets.all(10),
    backgroundColor:
        isError ? Colors.red.shade700.withOpacity(0.75) : kPrimaryColor,
  );
}

void overlayLoading(Future<void> Function() asyncFunction) {
  Get.showOverlay(
    asyncFunction: asyncFunction,
    opacityColor: Colors.white,
    loadingWidget: const Loading(),
  );
}
