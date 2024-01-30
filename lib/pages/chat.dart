import 'package:flutter/material.dart';
import 'package:nacho_chat/components/chat_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/utils.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      onPopInvoked: (didPop) {
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
        ),
        body: const ChatView(),
      ),
    );
  }
}
