import 'package:dio/dio.dart';
import 'package:owner_app/app/data/api/chat/chat_api.dart';
import 'package:owner_app/app/data/models/chat/chat_response.dart';

class ChatRepository {
  final Dio _dio;

  ChatRepository(this._dio);

  Future<List<Chat>> getChat() async {
    return (await ChatApi(_dio).getChat()).chat;
  }
}
