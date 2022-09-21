import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/utils/app_utils.dart';
import 'package:owner_app/app/widgets/custom_buttom.dart';

import '../../../widgets/input_field.dart';
import '../controllers/add_tenant_controller.dart';

class AddTenantView extends GetView<AddTenantController> {
  final controller = Get.find<AddTenantController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agreement form'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(child: Text('Rent')),
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
                  const Expanded(child: Text('Internet Price')),
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
                  const Expanded(child: Text('Water Usage Price')),
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
                  const Expanded(child: Text('Electricity Rate')),
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
                  const Expanded(child: Text('Nagarpalika Fihor Rate')),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Obx(() => InputField(
                          'Nagarpalika Fohor Rate',
                          controller: controller.nagarpalikaFohorRateController,
                          inputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          errorMessage:
                              controller.nagarpalikaFohorRateError.value,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton('Save Agreement', () {
                FocusScope.of(context).unfocus();
                overlayLoading(controller.saveAgreement);
              })
            ],
          ),
        ));
  }
}
