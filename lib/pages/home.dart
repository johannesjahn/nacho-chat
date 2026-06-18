import 'package:flutter/material.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';
import 'package:nacho_chat/components/post_list.dart';
import 'package:nacho_chat/pages/chat_list.dart';
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
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _fabController;
  late Animation<double> _fabScale;

  @override
  void initState() {
    super.initState();
    UserService.instance.getUserList();
    UserService.instance.getMe();
    ChatService.instance.getConversations();
    PostService.instance.getPosts();
    ChatService.instance.getNumberOfUnreadMessages();

    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fabScale = CurvedAnimation(
      parent: _fabController,
      curve: Curves.elasticOut,
    );
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _fabController.forward();
    });
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text("${l10n.hello}, ${AppService.instance.username}!"),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(10),
            onPressed: () {
              Navigator.of(context).push(DefaultRoute(const ChatListPage()));
            },
            icon: Stack(
              children: [
                const Icon(Icons.chat),
                ValueListenableBuilder<bool>(
                  valueListenable: ChatService.instance.unreadCountNotifier,
                  builder:
                      (context, value, widget) => Positioned(
                        bottom: 0,
                        right: 0,
                        child:
                            value
                                ? Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.inversePrimary,
                                  ),
                                )
                                : const SizedBox(),
                      ),
                ),
              ],
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(12),
            onPressed: () {
              Navigator.of(context).push(DefaultRoute(const ProfilePage()));
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(DefaultRoute(const SettingsPage()));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Stack(
        children: [
          ValueListenableBuilder<List<PostResponseDTO>>(
            valueListenable: PostService.instance.posts,
            builder:
                (context, value, child) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeOut,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.04),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child:
                      value.isEmpty
                          ? const SizedBox.shrink(key: ValueKey('empty'))
                          : PostList(key: const ValueKey('posts'), posts: value),
                ),
          ),
          const Positioned(bottom: 5, left: 5, child: VersionDisplay()),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabScale,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(DefaultRoute(const CreatePostWidget()));
          },
        ),
      ),
    );
  }
}
