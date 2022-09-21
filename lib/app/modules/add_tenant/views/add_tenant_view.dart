import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/modules/add_tenant/views/widgets/add_image_container.dart';
import 'package:owner_app/app/routes/app_pages.dart';
import 'package:owner_app/app/utils/app_utils.dart';
import 'package:owner_app/app/widgets/custom_buttom.dart';

import '../../../widgets/input_field.dart';
import '../controllers/add_tenant_controller.dart';

class AddTenantView extends GetView<AddTenantController> {
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
                      'Rent',
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
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Obx(() => InputField(
                            'Internet Price',
                            controller: controller.internetPriceController,
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            errorMessage: controller.internetPriceError.value,
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
                      'Water Usage Price',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Obx(() => InputField(
                            'Water Usage Price',
                            controller: controller.waterUsagePriceController,
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            errorMessage: controller.waterUsagePriceError.value,
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
                      'Electricity Rate',
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
                      'Nagarpalika Waste Cost',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Obx(() => InputField(
                            'Nagarpalika Waste Cost',
                            controller:
                                controller.nagarpalikaFohorRateController,
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            errorMessage:
                                controller.nagarpalikaFohorRateError.value,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Agreement Image(If Any)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InsertImageContainer(),
                const SizedBox(
                  height: 30,
                ),
                CustomButton('Generate QR', () {
                  // FocusScope.of(context).unfocus();
                  // overlayLoading(controller.saveAgreement);
                  Get.toNamed(Routes.QR_PAGE);
                })
              ],
            ),
          ),
        ));
  }
}
