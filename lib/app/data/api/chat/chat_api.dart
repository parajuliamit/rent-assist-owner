import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/chat/chat_response.dart';
import 'package:owner_app/app/data/models/chat/message_request.dart';
import 'package:owner_app/app/data/models/chat/message_response.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio) = _ChatApi;

  @GET("/chat/")
  Future<ChatResponse> getChat();

  @GET("/chat/inbox?friend={id}")
  Future<MessageResponse> getMessage(@Path("id") String id);

  @POST("/chat/send-message/")
  Future<void> sendMessage(@Body() MessageRequest message);
}
