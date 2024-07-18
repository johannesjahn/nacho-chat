import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/pages/chat.dart';
import 'package:openapi/openapi.dart';

import '../service/app.dart';
import '../service/chat.dart';
import 'avatar.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({super.key});

  // ignore: constant_identifier_names
  static const UNREAD_CIRCLE_SIZE = 20.0;

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
                  if (ChatService.instance.currentChat.value?.id !=
                      value[index].id) {
                    ChatService.instance.messagesNotifier.value = [];
                  }
                  ChatService.instance.currentChat.value = value[index];
                  ChatService.instance.markConversationAsRead(
                      conversationId: value[index].id.toInt());
                  if (!AppService.instance.isTablet) {
                    Navigator.push(context, DefaultRoute(const ChatPage()));
                  }
                },
                child: Builder(builder: (context) {
                  final nonSelfParticipants = value[index]
                      .participants
                      .where((participant) =>
                          participant.id != AppService.instance.userId)
                      .toList();
                  final chatTitle =
                      nonSelfParticipants.map((u) => u.username).join(", ");

                  final lastMessage = value[index].lastMessage;
                  String? messagePreview;

                  final l10n = AppLocalizations.of(context)!;

                  if (lastMessage != null) {
                    if (lastMessage.contentType ==
                        MessageResponseDTOContentTypeEnum.TEXT) {
                      messagePreview =
                          "${lastMessage.author.username}: ${lastMessage.content}";
                    } else {
                      messagePreview =
                          "${lastMessage.author.username}: ${l10n.media_message}";
                    }
                  }

                  var isUnread = false;

                  if (lastMessage?.author.id != AppService.instance.userId) {
                    if (!(lastMessage?.readBy
                            .any((p) => p.id == AppService.instance.userId) ??
                        true)) {
                      isUnread = true;
                    }
                  }

                  final preferredWidth = AppService.instance.isTablet
                      ? 200.0 - (isUnread ? UNREAD_CIRCLE_SIZE : 0)
                      : MediaQuery.of(context).size.width -
                          100 -
                          (isUnread ? UNREAD_CIRCLE_SIZE : 0);

                  return Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Builder(builder: (context) {
                            if (value[index].participants.length > 2) {
                              return NachoAvatar(
                                  user: nonSelfParticipants.first,
                                  radius: 15,
                                  users: value[index].participants.toList());
                            } else {
                              return NachoAvatar(
                                user: nonSelfParticipants.first,
                                radius: 15,
                              );
                            }
                          }),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: preferredWidth,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: preferredWidth - 100,
                                        child: Text(
                                          chatTitle,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      if (lastMessage != null)
                                        Text(
                                          shortFormatPostedDate(
                                              lastMessage.createdAt),
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor),
                                        )
                                    ],
                                  ),
                                ),
                                if (messagePreview != null)
                                  Container(
                                    constraints: BoxConstraints(
                                        minWidth: 0, maxWidth: preferredWidth),
                                    child: Text(
                                      messagePreview,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          isUnread
                              ? Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: Container(
                                      width: UNREAD_CIRCLE_SIZE,
                                      height: UNREAD_CIRCLE_SIZE,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary)))
                              : const SizedBox()
                        ],
                      ));
                }),
              ),
            );
          })),
    );
  }
}
