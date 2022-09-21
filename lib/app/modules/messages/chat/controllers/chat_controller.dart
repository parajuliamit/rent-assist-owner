import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';
import 'package:owner_app/app/data/models/chat/message_request.dart';
import 'package:owner_app/app/utils/app_utils.dart';

class ChatController extends GetxController {
  late final String tenantName;
  late final String tenantId;

  final chatRepo = Get.find<AppRepository>().getChatRepository();

  final isLoading = false.obs;
  late final TextEditingController messageController;

  @override
  void onInit() {
    super.onInit();
    tenantName = Get.parameters['name']!;
    tenantId = Get.parameters['tenantId']!;
    messageController = TextEditingController();
  }

  Future<void> sendMessage() async {
    var message = messageController.text.trim();
    if (message.isEmpty) return;
    isLoading(true);

    try {
      await chatRepo.sendMessage(
          MessageRequest(receiver: int.parse(tenantId), message: message));
      messageController.clear();
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
  void onClose() {
    messageController.dispose();
  }
}
