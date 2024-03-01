import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/components/chat_users_dialog.dart';
import 'package:nacho_chat/components/chat_view.dart';
import 'package:nacho_chat/components/conversation_list.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/user.dart';

import '../components/add_user_dialog.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  void initState() {
    super.initState();
    UserService.instance.getUserList();
    ChatService.instance.getConversations();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      onPopInvoked: (didPop) {
        if (!AppService.instance.isTablet) {
          return;
        }
        logger.i('didPop chat Tablet: $didPop');
        ChatService.instance.currentChat.value = null;
        ChatService.instance.messagesNotifier.value = [];
      },
      child: Builder(builder: (context) {
        final width = MediaQuery.of(context).size.width;

        AppService.instance.isTablet = width >= 750;

        return Scaffold(
          appBar: AppBar(
            title: Text("${l10n.hello}, ${AppService.instance.username}"),
            actions: [
              AppService.instance.isTablet
                  ? IconButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const AddUserDialog());
                      },
                      icon: const Icon(Icons.add))
                  : const SizedBox(),
              AppService.instance.isTablet
                  ? IconButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const ChatUsersDialog(),
                        );
                      },
                      icon: const Icon(Icons.info),
                    )
                  : const SizedBox(),
            ],
          ),
          floatingActionButton: !AppService.instance.isTablet
              ? FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AddUserDialog());
                  },
                )
              : null,
          body: Builder(builder: (context) {
            final width = MediaQuery.of(context).size.width;

            if (width < 750) {
              return const ConversationList();
            }

            return Row(
              children: [
                const SizedBox(width: 300, child: ConversationList()),
                SizedBox(width: width - 300, child: const ChatView())
              ],
            );
          }),
        );
      }),
    );
  }
}
