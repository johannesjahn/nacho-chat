import 'package:flutter/material.dart';
import 'package:nacho_chat/pages/chat.dart';
import 'package:openapi/openapi.dart';

import '../service/app.dart';
import '../service/chat.dart';
import 'avatar.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ConversationResponseDTO>>(
      valueListenable: ChatService.instance.filteredConversations,
      builder: (context, value, widget) => ListView.builder(
          itemCount: value.length,
          itemBuilder: ((context, index) {
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  ChatService.instance.currentChat.value = value[index];
                  ChatService.instance
                      .getMessages(conversationId: value[index].id.toInt());
                  if (!AppService.instance.isTablet) {
                    Navigator.push(context, DefaultRoute(const ChatPage()));
                  }
                },
                child: Builder(builder: (context) {
                  final nonSelfParticipants = value[index]
                      .participants
                      .where((participant) =>
                          participant.username !=
                          AppService.instance.hive.get("username"))
                      .toList();
                  final chatTitle =
                      nonSelfParticipants.map((u) => u.username).join(", ");

                  return Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          NachoAvatar(
                              userId: nonSelfParticipants.first.id, radius: 15),
                          Text(chatTitle),
                        ],
                      ));
                }),
              ),
            );
          })),
    );
  }
}
