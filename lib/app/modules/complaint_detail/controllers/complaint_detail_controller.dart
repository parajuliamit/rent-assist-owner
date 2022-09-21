import 'package:get/get.dart';
import 'package:owner_app/app/data/models/complaints/complaints_response.dart';

class ComplaintDetailController extends GetxController {
  Complaint? complaint;
  @override
  void onInit() {
    super.onInit();
    complaint = Get.arguments as Complaint;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
