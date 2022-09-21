import 'package:flutter/material.dart';
import 'package:owner_app/app/modules/messages/chat/controllers/chat_controller.dart';
import 'package:owner_app/app/utils/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message, Key? key}) : super(key: key);

  final FormattedMessage message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: message.isMe ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(message.isMe ? size.width * 0.2 : 10, 5,
            message.isMe ? 10 : size.width * 0.2, 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: message.isMe ? kPrimaryColor : Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: message.isMe ? Radius.circular(10) : Radius.zero,
              bottomRight: message.isMe ? Radius.zero : Radius.circular(10),
            )),
        child: Text(
          message.message,
          style: TextStyle(
              color: message.isMe ? Colors.white : Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
