import 'package:flutter/material.dart';
import 'package:nacho_chat/components/chat_view.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: const ChatView(),
    );
  }
}
