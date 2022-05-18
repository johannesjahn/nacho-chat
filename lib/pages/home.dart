import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nacho_chat/components/chat_view.dart';
import 'package:nacho_chat/components/conversation_list.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/user.dart';

import '../components/add_user_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            Text("Hello " + (AppService.instance.hive.get("username") ?? "")),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const AddUserDialog());
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                AppService.instance.hive.delete("access_token");
                Navigator.pushReplacementNamed(context, "/login");
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
