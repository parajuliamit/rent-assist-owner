import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/app_utils.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/input_field.dart';
import '../controllers/edit_tenant_controller.dart';

class EditTenantView extends GetView<EditTenantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Tenant'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Monthly Rent',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Obx(() => InputField(
                            'Rent',
                            controller: controller.rentController,
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            errorMessage: controller.rentError.value,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Internet Price',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InputField(
                        'Internet Price',
                        controller: controller.internetPriceController,
                        inputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // errorMessage: controller.internetPriceError.value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Water Price (per month)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InputField(
                        'Water Price',
                        controller: controller.waterUsagePriceController,
                        inputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // errorMessage: controller.waterUsagePriceError.value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Electricity Rate (per unit)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Obx(() => InputField(
                            'Electricity Rate',
                            controller: controller.electricityRateController,
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            errorMessage: controller.electricityRateError.value,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Others (Waste etc.)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: InputField(
                        'Others',
                        controller: controller.nagarpalikaFohorRateController,
                        inputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // errorMessage:
                        //     controller.nagarpalikaFohorRateError.value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton('Update Agreement', () {
                  FocusScope.of(context).unfocus();
                  overlayLoading(controller.saveAgreement);
                  // Get.toNamed(Routes.QR_PAGE);
                }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
