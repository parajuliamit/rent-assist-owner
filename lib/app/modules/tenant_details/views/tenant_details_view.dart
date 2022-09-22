import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';
import 'package:owner_app/app/utils/constants.dart';

import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/tenant_details_controller.dart';

class TenantDetailsView extends GetView<TenantDetailsController> {
  Widget getRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              )),
          Expanded(
              flex: 2,
              child: Text(
                'Rs ${value}',
                style: const TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }

  Widget infoRow(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              data,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.name),
          actions: [
            IconButton(
                onPressed: () {
                  Get.offNamed(Routes.EDIT_TENANT,
                      arguments: controller.agreement,
                      parameters: {
                        "tenant": ((controller.tenant.tenant) ?? 0).toString()
                      });
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Delete ${controller.name}"),
                          content: Text(
                              "Are you sure you want to delete ${controller.name}"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                  controller.deleteTenant();
                                },
                                child: Text("Delete")),
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
        body: Obx(() => controller.isLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(controller.errorMessage, controller.getDetails)
                : SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          const Text("Basic Info",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor)),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: kPrimaryColor)),
                            child: Column(
                              children: [
                                infoRow('Name :',
                                    '${controller.tenant.firstName} ${controller.tenant.lastName}'),
                                infoRow(
                                    'Email :', '${controller.tenant.email}'),
                                infoRow('Phone :',
                                    '${controller.tenant.phoneNumber}'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Agreement Details",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor)),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.1),
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                getRow("Monthly Rent :",
                                    "${controller.agreement?.price}"),
                                getRow("Electricy Charges (per unit) :",
                                    "${controller.agreement?.electricityRate}"),
                                getRow("Water Charge (per month) :",
                                    "${controller.agreement?.waterUsagePrice}"),
                                getRow("Internet Charge :",
                                    "${controller.agreement?.internetPrice}"),
                                getRow("Others(eg. Waste) :",
                                    "${controller.agreement?.nagarpalikaFohrPrice}"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<TenantDetailsController>(
                              builder: (controller) {
                            return controller.document == null
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      const Text("Documents",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: kPrimaryColor)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.network(
                                          controller.document!.citizenship ??
                                              '')
                                    ],
                                  );
                          })
                        ])))));
  }
}
