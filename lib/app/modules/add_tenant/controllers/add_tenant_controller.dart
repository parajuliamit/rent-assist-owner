import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/exception/server_exception.dart';
import '../../../utils/app_utils.dart';

class AddTenantController extends GetxController {
  late final TextEditingController rentController;
  late final TextEditingController internetPriceController;
  late final TextEditingController waterUsagePriceController;
  late final TextEditingController electricityRateController;
  late final TextEditingController nagarpalikaFohorRateController;

  final rentError = ''.obs;
  final internetPriceError = ''.obs;
  final waterUsagePriceError = ''.obs;
  final electricityRateError = ''.obs;
  final nagarpalikaFohorRateError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    rentController = TextEditingController();
    internetPriceController = TextEditingController();
    waterUsagePriceController = TextEditingController();
    electricityRateController = TextEditingController();
    nagarpalikaFohorRateController = TextEditingController();

    rentController.addListener(() {
      rentError.value = "";
    });

    internetPriceController.addListener(() {
      internetPriceError.value = "";
    });
    waterUsagePriceController.addListener(() {
      waterUsagePriceError.value = "";
    });

    electricityRateController.addListener(() {
      electricityRateError.value = "";
    });
    nagarpalikaFohorRateController.addListener(() {
      nagarpalikaFohorRateError.value = "";
    });
  }

  Future<void> saveAgreement() async {
    String rent = rentController.text.trim();
    String internetPrice = internetPriceController.text.trim();
    String waterPrice = waterUsagePriceController.text.trim();
    String electricityRate = electricityRateController.text.trim();
    String nagarpalikaFohorRate = nagarpalikaFohorRateController.text.trim();
    if (validateInput(rent, internetPrice, waterPrice, electricityRate,
        nagarpalikaFohorRate)) {
      try {
        showSnackbar('Agreement Uploaded Successfully');
      } catch (e) {
        if (e is DioError) {
          handleError(e);
        } else {
          showSnackbar(e.toString(), isError: true);
        }
      }
    }
  }

  void handleError(DioError e) {
    var error = ServerError.withError(error: e).getError();
    print(error);
    if (error != null) {
      if (error.containsKey('detail')) {
        showSnackbar(error['detail'], isError: true);
        return;
      }
      if (error.containsKey('non_field_errors')) {
        showSnackbar(error['non_field_errors']![0], isError: true);
      }
    } else {
      showSnackbar(ServerError.withError(error: e).getErrorMessage(),
          isError: true);
    }
  }

  bool validateInput(String rent, String internetPrice, String waterPrice,
      String electricityRate, String nagarpalikaFohorRate) {
    bool isValid = true;
    if (rent.length < 1) {
      rentError('Rent cant be less than 1');
      isValid = false;
    }
    if (internetPrice.length < 1) {
      internetPriceError('Internet price cant be less than 1');
      isValid = false;
    }
    if (waterPrice.length < 1) {
      waterUsagePriceError('Water price cant be less than 1');
      isValid = false;
    }

    if (electricityRate.length < 1) {
      electricityRateError('Electricity rate cant be less than 1');
      isValid = false;
    }

    if (nagarpalikaFohorRate.length < 1) {
      nagarpalikaFohorRateError('Nagarpalika fohor rate cant be less than 1');
      isValid = false;
    }
    return isValid;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    rentController.dispose();
    electricityRateController.dispose();
    waterUsagePriceController.dispose();
    nagarpalikaFohorRateController.dispose();
    internetPriceController.dispose();
  }
}
