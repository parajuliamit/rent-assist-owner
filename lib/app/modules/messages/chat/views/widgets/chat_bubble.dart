import 'package:flutter/material.dart';
import 'package:owner_app/app/utils/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.isMe, Key? key}) : super(key: key);

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: isMe ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(
            isMe ? size.width * 0.2 : 10, 5, isMe ? 10 : size.width * 0.2, 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isMe ? kPrimaryColor : Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: isMe ? Radius.circular(10) : Radius.zero,
              bottomRight: isMe ? Radius.zero : Radius.circular(10),
            )),
        child: Text(
          'Hello Mama',
          style: TextStyle(
              color: isMe ? Colors.white : Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
