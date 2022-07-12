import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:openapi/openapi.dart';

import '../service/app.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final inputController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ValueListenableBuilder<ConversationResponseDTO?>(
      valueListenable: ChatService.instance.currentChat,
      builder: (context, value, widget) {
        if (value == null) {
          return const Center(child: Text("Select a conversation"));
        }
        return Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<MessageResponseDTO>>(
                  valueListenable: ChatService.instance.messagesNotifier,
                  builder: (context, value, widget) {
                    return ListView.builder(
                        itemCount: value.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final message = value[index];
                          return Row(
                            mainAxisAlignment: message.author.username ==
                                    AppService.instance.hive.get("username")
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Card(
                                  child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(message.content)))
                            ],
                          );
                        });
                  }),
            ),
            Container(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: inputController,
                        focusNode: focusNode,
                        onFieldSubmitted: (text) async {
                          inputController.clear();
                          await ChatService.instance.sendMessage(
                            conversationId: value.id.toInt(),
                            message: text,
                          );
                          focusNode.requestFocus();
                        },
                        decoration: const InputDecoration(
                          labelText: 'Message',
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await ChatService.instance.sendMessage(
                            conversationId: value.id.toInt(),
                            message: inputController.text,
                          );
                          inputController.clear();
                        },
                        icon: const Icon(Icons.send))
                  ]),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
