import 'package:flutter/material.dart';
import 'package:nacho_chat/components/avatar.dart';
import 'package:nacho_chat/components/edit_chat_title_dialog.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:openapi/openapi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatUsersDialog extends StatelessWidget {
  const ChatUsersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final chatService = ChatService.instance;
    final l10n = AppLocalizations.of(context)!;

    return ValueListenableBuilder<ConversationResponseDTO?>(
      valueListenable: chatService.currentChat,
      builder: (context, value, widget) => AlertDialog(
          title: Center(
              child: value?.title != null
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (context) => EditChatTitleDialog(
                                  initialTitle: value.title ?? "",
                                ));
                      },
                      child: Text(value!.title!))
                  : Text(l10n.participants)),
          content: Builder(builder: (context) {
            if (value == null) return const SizedBox();
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...value.participants.map((user) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: NachoAvatar(
                                        user: user,
                                        radius: 20,
                                      )),
                                  Text(user.username),
                                ],
                              ),
                            ]),
                      )),
                ],
              ),
            );
          })),
    );
  }
}
