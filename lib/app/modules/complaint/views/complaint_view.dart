import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../utils/time_ago.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading.dart';
import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  Color getColor(String urgencyLevel) {
    if (urgencyLevel == "H") return Colors.red;
    if (urgencyLevel == "I") return Colors.deepOrange;
    if (urgencyLevel == "L") return Colors.deepPurple;
    return Colors.blueGrey;
  }

  IconData getIcon(String urgencyLevel) {
    if (urgencyLevel == "H") return Icons.gpp_maybe_outlined;
    if (urgencyLevel == "I") return Icons.error;
    if (urgencyLevel == "L") return Icons.priority_high_outlined;
    return Icons.warning;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
      ),
      body: Obx(() => controller.isLoading.isTrue
          ? const Loading()
          : controller.isError.isTrue
              ? ErrorPage(controller.errorMessage, controller.loadComplaints)
              : controller.complaints.isEmpty
                  ? const Center(
                      child: Text('You have no complaints'),
                    )
                  : ListView.builder(
                      itemCount: controller.complaints.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.COMPLAINT_DETAIL,
                                arguments: controller.complaints[index]);
                          },
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading:
                                  controller.complaints[index].isSolved == true
                                      ? const Icon(
                                          Icons.check_circle,
                                          size: 30,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          getIcon(controller
                                              .complaints[index].urgencyLevel
                                              .toString()),
                                          size: 30,
                                          color: getColor(controller
                                              .complaints[index].urgencyLevel
                                              .toString()),
                                        ),
                              title: Text(
                                controller.complaints[index].title ?? '',
                                maxLines: 1,
                              ),
                              trailing: const Icon(Icons.chevron_right),
                              subtitle: Text(convertToAgo(DateTime.parse(
                                  controller.complaints[index].date ?? ''))),
                            ),
                          ),
                        );
                      },
                    )),
    );
  }
}
