import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';
import 'package:owner_app/app/widgets/custom_buttom.dart';
import 'package:owner_app/app/widgets/error_page.dart';
import 'package:owner_app/app/widgets/loading.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../controllers/tenant_list_controller.dart';

class TenantListView extends GetView<TenantListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Tenants'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_TENANT);
          },
          child: const Icon(Icons.add),
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Loading()
              : controller.isError.isTrue
                  ? ErrorPage(controller.errorMessage, controller.getTenants)
                  : controller.tenants.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'No tenants found',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                                'Add Tenant',
                                () {
                                  Get.toNamed(Routes.ADD_TENANT);
                                },
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: controller.getTenants,
                          child: ListView.builder(
                            itemCount: controller.tenants.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.fromLTRB(
                                    15, index == 0 ? 16 : 8, 15, 5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              kPrimaryColor.withOpacity(0.25),
                                          spreadRadius: 5,
                                          offset: const Offset(0, 3),
                                          blurRadius: 10)
                                    ]),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: kGreyColor,
                                      radius: 25,
                                      child: Icon(Icons.person),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${controller.tenants[index].firstName} ${controller.tenants[index].lastName}',
                                        style: const TextStyle(
                                            // color: kWhiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: FloatingActionButton(
                                            child: const Icon(Icons.call),
                                            onPressed: () {
                                              final Uri launchUri = Uri(
                                                scheme: 'tel',
                                                path: controller
                                                    .tenants[index].phoneNumber,
                                              );
                                              launchUrl(launchUri);
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 40,
                                          child: FloatingActionButton(
                                              child: const Icon(Icons.message),
                                              onPressed: () {
                                                Get.toNamed(Routes.CHAT,
                                                    parameters: {
                                                      "name":
                                                          '${controller.tenants[index].firstName} ${controller.tenants[index].lastName}',
                                                      "tenantId": controller
                                                          .tenants[index].tenant
                                                          .toString(),
                                                    });
                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
        ));
  }
}
