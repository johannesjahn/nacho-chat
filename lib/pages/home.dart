import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/components/post_list.dart';
import 'package:nacho_chat/pages/chat_list.dart';
import 'package:nacho_chat/pages/login.dart';
import 'package:nacho_chat/pages/profile.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/user.dart';
import 'package:openapi/openapi.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../components/create_post.dart';

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
      bottomSheet: FutureBuilder(
          future: PackageInfo.fromPlatform(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData)
              return Text(
                  "${snapshot.data!.version}+${snapshot.data!.buildNumber}");
            return const Text("Nacho Chat");
          }),
      appBar: AppBar(
        title:
            // ignore: prefer_interpolation_to_compose_strings
            Text(l10n.hello +
                ", " +
                (AppService.instance.hive.get("username") ?? "")),
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
                Navigator.of(context).push(DefaultRoute(ProfilePage()));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              padding: const EdgeInsets.all(10),
              onPressed: () async {
                await AppService.instance.logout();
                Navigator.push(context, DefaultRoute(LoginPage()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostResponseDTO>>(
        valueListenable: PostService.instance.posts,
        builder: (context, value, widget) => PostList(posts: value),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(DefaultRoute(const CreatePostWidget()));
        },
      ),
    );
  }
}
