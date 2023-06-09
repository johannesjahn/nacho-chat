import 'dart:io' show Platform;

import 'package:hive_flutter/hive_flutter.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/constants.dart';
import 'package:nacho_chat/service/interceptors/authInterceptor.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/user.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

export 'utils.dart';

class AppService {
  static final instance = AppService._();

  bool isTablet = false;

  Future<void> init() async {
    await Hive.initFlutter();
    hive = await Hive.openBox<String>("default");
    if (hive.get("access_token") != null) {
      initWebsocket();
    }
  }

  AppService._();

  final api =
      Openapi(basePathOverride: Urls.url, interceptors: [AuthInterceptor()]);
  late Box<String> hive;

  IO.Socket? socket;
  initWebsocket() async {
    try {
      // authenticate websocket with access token from API
      final token = hive.get("access_token")!;
      if (Platform.isAndroid ||
          Platform.isIOS ||
          Platform.isMacOS ||
          Platform.isLinux ||
          Platform.isWindows) {
        socket = IO.io(
            Urls.url,
            IO.OptionBuilder().setAuth({"token": token}).setTransports(
                ['websocket']).build());
      } else {
        socket = IO.io(
            Urls.url, IO.OptionBuilder().setAuth({"token": token}).build());
      }
    } catch (e) {
      final token = hive.get("access_token")!;
      socket =
          IO.io(Urls.url, IO.OptionBuilder().setAuth({"token": token}).build());
    }

    socket!.onConnect((data) {
      logger.i("Connected to websocket");
    });
    socket!.on('post', (data) {
      logger.i('New Post');
      PostService.instance.getPosts();
    });
    socket!.on('post/comment', (postId) {
      logger.i('New Comment');
      if (PostService.instance.selectedPost.value?.id == postId) {
        PostService.instance.getComments();
      }
    });
    socket!.on('post/comment/reply', (commentId) {
      logger.i('New Reply');
      if (PostService.instance.selectedPost.value?.comments
              ?.any((comment) => comment.id == commentId) ??
          false) {
        PostService.instance.getComments();
      }
    });
    socket!.on("message", (data) async {
      logger.i("New Message in conversation ${data["conversationId"]}");
      await ChatService.instance.getConversations();
      if (ChatService.instance.currentChat.value != null &&
          ChatService.instance.currentChat.value?.id ==
              data["conversationId"]) {
        await ChatService.instance.getMessages(
            conversationId: ChatService.instance.currentChat.value!.id as int);
      }
    });

    socket!.onConnectError((data) => logger.e(data));
    socket!.onConnectTimeout((data) => logger.e(data));
  }

  /// Logs out the user by deleting all data from the local storage and disconnecting from the websocket
  logout() async {
    await hive.deleteAll(hive.keys.toList());
    UserService.instance.me.value = null;
    ChatService.instance.currentChat.value = null;
    ChatService.instance.conversations = [];
    ChatService.instance.filteredConversations.value = [];
    ChatService.instance.messagesNotifier.value = [];
    socket?.disconnect();
  }

  Future<VersionDTO> getBackendVersion() async {
    final response = await api.getDefaultApi().appControllerGetVersion();
    logger.i("Backend version: ${response.data!.version}");
    return response.data!;
  }
}
