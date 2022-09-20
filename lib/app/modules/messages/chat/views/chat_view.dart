import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import 'widgets/chat_bubble.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      isMe: index % 2 == 0,
                    );
                  }),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          fillColor: Colors.grey.shade100,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ));
  }
}
