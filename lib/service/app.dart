import 'dart:io' show Platform;

import 'package:hive_flutter/hive_flutter.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/constants.dart';
import 'package:nacho_chat/service/interceptors/authInterceptor.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/user.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

export 'utils.dart';

class AppService {
  static final instance = AppService._();

  String? _username;
  num? _userId;
  String? _accessToken;

  String get username {
    _username ??= hive.get("username");
    return _username ?? "";
  }

  num get userId {
    if (_userId != null) return _userId!;
    final t = num.parse(AppService.instance.hive.get("user_id") ?? "-1");
    if (t != -1) {
      _userId = t;
    }
    return t;
  }

  String? get accessToken {
    _accessToken ??= hive.get("access_token");
    return _accessToken;
  }

  bool isTablet = false;

  Future<void> init() async {
    await Hive.initFlutter();
    hive = await Hive.openBox<String>("default");
    if (hive.get("access_token") != null) {
      initWebsocket();
    }
  }

  AppService._();

  final api = Openapi(
    basePathOverride: Urls.getUrl(),
    interceptors: [AuthInterceptor()],
  );
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
          Urls.getUrl(),
          IO.OptionBuilder().setAuth({"token": token}).setTransports([
            'websocket',
          ]).build(),
        );
      } else {
        socket = IO.io(
          Urls.getUrl(),
          IO.OptionBuilder().setAuth({"token": token}).build(),
        );
      }
    } catch (e) {
      logger.e("Exception during websocket init.");
      logger.e(e);
      final token = hive.get("access_token")!;
      socket = IO.io(
        Urls.getUrl(),
        IO.OptionBuilder().setAuth({"token": token}).build(),
      );
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
      if (PostService.instance.selectedPost.value?.comments?.any(
            (comment) => comment.id == commentId,
          ) ??
          false) {
        PostService.instance.getComments();
      }
    });
    socket!.on("message", (data) async {
      ChatService.instance.getNumberOfUnreadMessages();
      await ChatService.instance.getConversations();
      if (data == null) return;
      logger.i("New Message in conversation ${data["conversationId"]}");
      if (ChatService.instance.currentChat.value != null &&
          ChatService.instance.currentChat.value?.id ==
              data["conversationId"]) {
        await ChatService.instance.getMessages(
          conversationId: ChatService.instance.currentChat.value!.id as int,
        );
      }
    });

    socket!.on("conversation", (data) async {
      logger.i("New Conversation");
    });

    socket!.onConnectError((data) => logger.e(data));
  }

  /// Logs out the user by deleting all data from the local storage and disconnecting from the websocket
  logout() async {
    await hive.deleteAll(hive.keys.toList());
    _userId = null;
    _username = null;
    _accessToken = null;
    UserService.instance.me.value = null;
    ChatService.instance.currentChat.value = null;
    ChatService.instance.conversations = [];
    ChatService.instance.filteredConversations.value = [];
    ChatService.instance.messagesNotifier.value = [];
    socket?.disconnect();
  }

  VersionDTO? _backendVersion;
  Future<VersionDTO> getBackendVersion() async {
    if (_backendVersion != null) return _backendVersion!;
    final response = await api.getAppApi().appControllerGetVersion();
    logger.i("Backend version: ${response.data!.version}");
    _backendVersion = response.data;
    return _backendVersion!;
  }
}
