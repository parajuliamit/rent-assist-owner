import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/modules/tenant_list/controllers/tenant_list_controller.dart';

import '../../../utils/constants.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/rent_details_controller.dart';

class RentDetailsView extends GetView<RentDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rent Details'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Loading()
              : controller.isError.isTrue
                  ? ErrorPage(controller.errorMessage, controller.loadRents)
                  : controller.rents.isEmpty
                      ? const Center(
                          child: Text(
                            'No rents yet',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.rents.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.money,
                                  color: kPrimaryColor,
                                ),
                                title: Text((Get.find<TenantListController>()
                                        .tenants
                                        .firstWhereOrNull((element) =>
                                            element.tenant ==
                                            controller.rents[index].tenant)
                                        ?.firstName ??
                                    'Deleted Tenant')),
                                subtitle: Text(
                                    'Rent: Rs ${controller.rents[index].amountToBePaid}'),
                                trailing: Text(
                                    'Paid: Rs ${controller.rents[index].amountPaidThisMonth}'),
                              ),
                            );
                          },
                        ),
        ));
  }
}
