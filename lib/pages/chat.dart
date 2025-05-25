import 'package:flutter/material.dart';
import 'package:nacho_chat/components/chat_users_dialog.dart';
import 'package:nacho_chat/components/chat_view.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/chat.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (AppService.instance.isTablet) {
          return;
        }
        logger.i('didPop chat Mobile: $didPop');
        ChatService.instance.currentChat.value = null;
        ChatService.instance.messagesNotifier.value = [];
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.chat),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text(l10n.participants),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ChatUsersDialog(),
                      );
                    },
                  ),
                ];
              },
            ),
          ],
        ),
        body: const ChatView(),
      ),
    );
  }
}
