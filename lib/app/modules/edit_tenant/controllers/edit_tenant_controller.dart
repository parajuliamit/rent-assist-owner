import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/data/models/user/agreement_response.dart';
import 'package:owner_app/app/data/models/user/edit_tenant_request.dart';

import '../../../app_repository.dart';
import '../../../data/exception/server_exception.dart';
import '../../../utils/app_utils.dart';

class EditTenantController extends GetxController {
  late final TextEditingController rentController;
  late final TextEditingController internetPriceController;
  late final TextEditingController waterUsagePriceController;
  late final TextEditingController electricityRateController;
  late final TextEditingController nagarpalikaFohorRateController;

  final userRepo = Get.find<AppRepository>().getUserRepository();

  final rentError = ''.obs;
  // final internetPriceError = ''.obs;
  // final waterUsagePriceError = ''.obs;
  final electricityRateError = ''.obs;
  // final nagarpalikaFohorRateError = ''.obs;

  late int tenant;

  @override
  void onInit() {
    super.onInit();
    Agreement agreement = Get.arguments;
    tenant = int.parse(Get.parameters['tenant']!);
    rentController = TextEditingController(text: agreement.price.toString());
    internetPriceController =
        TextEditingController(text: agreement.internetPrice.toString());
    waterUsagePriceController =
        TextEditingController(text: agreement.waterUsagePrice.toString());
    electricityRateController =
        TextEditingController(text: agreement.electricityRate.toString());
    nagarpalikaFohorRateController =
        TextEditingController(text: agreement.nagarpalikaFohrPrice.toString());

    rentController.addListener(() {
      rentError.value = "";
    });

    // internetPriceController.addListener(() {
    //   internetPriceError.value = "";
    // });
    // waterUsagePriceController.addListener(() {
    //   waterUsagePriceError.value = "";
    // });

    electricityRateController.addListener(() {
      electricityRateError.value = "";
    });
    // nagarpalikaFohorRateController.addListener(() {
    //   nagarpalikaFohorRateError.value = "";
    // });
  }

//tenant.id pathauni delete ma
  Future<void> saveAgreement() async {
    String rent = rentController.text.trim();
    String internetPrice = internetPriceController.text.trim();
    String waterPrice = waterUsagePriceController.text.trim();
    String electricityRate = electricityRateController.text.trim();
    String nagarpalikaFohorRate = nagarpalikaFohorRateController.text.trim();
    if (validateInput(rent, internetPrice, waterPrice, electricityRate,
        nagarpalikaFohorRate)) {
      try {
        var response = await userRepo.editTenant(EditTenantRequest(
            price: int.parse(rent),
            electricityRate: int.parse(electricityRate),
            waterUsagePrice: int.tryParse(waterPrice),
            internetPrice: int.tryParse(internetPrice),
            nagarpalikaFohrPrice: int.tryParse(nagarpalikaFohorRate),
            tenant: tenant));
        Get.back();
        showSnackbar('Agreement Updated Successfully');
      } catch (e) {
        showSnackbar(e.toString(), isError: true);
        if (e is DioError) {
          handleError(e);
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
      if (error.containsKey('price')) {
        rentError(error['price']![0]);
      }
      if (error.containsKey('electricity')) {
        electricityRateError(error['electricity']![0]);
      }
    } else {
      showSnackbar(ServerError.withError(error: e).getErrorMessage(),
          isError: true);
    }
  }

  bool validateInput(String rent, String internetPrice, String waterPrice,
      String electricityRate, String nagarpalikaFohorRate) {
    bool isValid = true;
    if (rent.isEmpty) {
      rentError('*Required');
      isValid = false;
    }
    // if (internetPrice.length < 1) {
    //   internetPriceError('Internet price cant be less than 1');
    //   isValid = false;
    // }
    // if (waterPrice.length < 1) {
    //   waterUsagePriceError('Water price cant be less than 1');
    //   isValid = false;
    // }

    if (electricityRate.isEmpty) {
      electricityRateError('*Required');
      isValid = false;
    }

    // if (nagarpalikaFohorRate.length < 1) {
    //   nagarpalikaFohorRateError('Nagarpalika fohor rate cant be less than 1');
    //   isValid = false;
    // }
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
