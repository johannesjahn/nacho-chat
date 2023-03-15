import 'package:flutter/material.dart';
import 'package:nacho_chat/components/chat_view.dart';
import 'package:nacho_chat/components/conversation_list.dart';
import 'package:nacho_chat/pages/login.dart';
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
    return Scaffold(
      appBar: AppBar(
        title:
            // ignore: prefer_interpolation_to_compose_strings
            Text("Hello, " + (AppService.instance.hive.get("username") ?? "")),
        actions: [
          true
              ? SizedBox()
              : IconButton(
                  padding: const EdgeInsets.all(10),
                  icon: Icon(Icons.bug_report),
                  onPressed: () async {
                    // create a snackbar
                    await UserService.instance.uploadAvatar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Bugs Bugs Bugs everywhere 🐛🐛🐛')));
                  },
                ),
          IconButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const AddUserDialog());
              },
              icon: const Icon(Icons.add)),
          IconButton(
              padding: const EdgeInsets.all(10),
              onPressed: () async {
                await AppService.instance.logout();
                Navigator.push(context, DefaultRoute(LoginPage()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Builder(builder: (context) {
        final width = MediaQuery.of(context).size.width;

        if (width < 750) {
          AppService.instance.isTablet = false;
          return const ConversationList();
        }

        AppService.instance.isTablet = true;
        return Row(
          children: [
            Container(width: 300, child: const ConversationList()),
            Container(width: width - 300, child: const ChatView())
          ],
        );
      }),
    );
  }
}
