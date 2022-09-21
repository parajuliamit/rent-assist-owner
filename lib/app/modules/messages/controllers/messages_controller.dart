import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';

import '../../../data/models/chat/chat_response.dart';

class MessagesController extends GetxController {
  final chatRepo = Get.find<AppRepository>().getChatRepository();

  final isError = false.obs;
  final isLoading = false.obs;

  String errorMessage = '';

  List<Chat> chat = [];

  @override
  void onInit() {
    super.onInit();
    getChat();
  }

  Future<void> getChat() async {
    isLoading(true);
    isError(false);
    try {
      chat = await chatRepo.getChat();
    } catch (e) {
      isError(true);
      if (e is DioError) {
        errorMessage = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorMessage = e.toString();
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
