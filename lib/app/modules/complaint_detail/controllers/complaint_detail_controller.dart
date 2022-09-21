import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';
import 'package:owner_app/app/data/models/complaints/complaints_response.dart';
import 'package:owner_app/app/data/models/complaints/edit_complaint_request.dart';
import 'package:owner_app/app/modules/complaint/controllers/complaint_controller.dart';
import 'package:owner_app/app/utils/app_utils.dart';

class ComplaintDetailController extends GetxController {
  Complaint? complaint;
  late final TextEditingController remarksController;
  final complaintRepo = Get.find<AppRepository>().getComplaintsRepository();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    complaint = Get.arguments as Complaint;
    remarksController = TextEditingController();
  }

  Future<void> sendRemarks(bool isSolved) async {
    var remarks = remarksController.text.trim();
    if (remarks.isEmpty) {
      showSnackbar('Please enter remarks', isError: true);
      return;
    }
    isLoading(true);
    try {
      await complaintRepo.editComplaint(
          "${complaint!.id}",
          EditComplaintRequest(
              status: remarksController.text, isSolved: isSolved));
      Get.back();
      showSnackbar(isSolved
          ? 'Complaint marked as solved.'
          : 'Remarks sent successfully.');
      Get.find<ComplaintController>().loadComplaints();
    } catch (e) {
      if (e is DioError) {
        showSnackbar(ServerError.withError(error: e).getErrorMessage(),
            isError: true);
      } else {
        showSnackbar(e.toString(), isError: true);
      }
    }
    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
