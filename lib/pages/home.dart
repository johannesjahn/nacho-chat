import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/components/post_list.dart';
import 'package:nacho_chat/pages/chat_list.dart';
import 'package:nacho_chat/pages/login.dart';
import 'package:nacho_chat/pages/profile.dart';
import 'package:nacho_chat/pages/settings.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/user.dart';
import 'package:openapi/openapi.dart';

import '../components/create_post.dart';
import '../components/version_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    UserService.instance.getUserList();
    UserService.instance.getMe();
    ChatService.instance.getConversations();
    PostService.instance.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      // version number
      appBar: AppBar(
        title: Text("${l10n.hello}, ${AppService.instance.username}"),
        actions: [
          IconButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Navigator.of(context).push(DefaultRoute(const ChatListPage()));
              },
              icon: const Icon(Icons.chat)),
          IconButton(
              padding: const EdgeInsets.all(12),
              onPressed: () {
                Navigator.of(context).push(DefaultRoute(const ProfilePage()));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(DefaultRoute(SettingsPage()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Stack(
        children: [
          ValueListenableBuilder<List<PostResponseDTO>>(
            valueListenable: PostService.instance.posts,
            builder: (context, value, widget) => PostList(posts: value),
          ),
          const Positioned(bottom: 5, left: 5, child: VersionDisplay())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(DefaultRoute(const CreatePostWidget()));
        },
      ),
    );
  }
}
