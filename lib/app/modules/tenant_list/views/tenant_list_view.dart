import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';
import 'package:owner_app/app/widgets/custom_buttom.dart';
import 'package:owner_app/app/widgets/error_page.dart';
import 'package:owner_app/app/widgets/loading.dart';

import '../../../utils/constants.dart';
import '../../home/views/widgets/hompage_button.dart';
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
                      : ListView.builder(
                          itemCount: controller.tenants.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: Container(
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
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: kGreyColor,
                                          radius: 25,
                                          child: Icon(Icons.person),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${controller.tenants[index].firstName} ${controller.tenants[index].lastName}',
                                          style: const TextStyle(
                                              // color: kWhiteColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: HomePageButton(
                                              text: 'View Details',
                                              textColor: kWhiteColor,
                                              fillColor: kPrimaryColor,
                                              onpress: () {}),
                                        ),
                                        Expanded(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FloatingActionButton(
                                                child: const Icon(Icons.call),
                                                onPressed: () {}),
                                            FloatingActionButton(
                                                child:
                                                    const Icon(Icons.message),
                                                onPressed: () {}),
                                          ],
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
        ));
  }
}
