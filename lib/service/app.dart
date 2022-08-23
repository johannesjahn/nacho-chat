import 'dart:developer';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/constants.dart';
import 'package:nacho_chat/service/interceptors/authInterceptor.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io' show Platform;

export 'utils.dart';

class AppService {
  static final instance = AppService._();

  bool isTablet = false;

  Future<void> init() async {
    await Hive.initFlutter();
    hive = await Hive.openBox<String>("default");
    initWebsocket();
  }

  AppService._();

  final api =
      Openapi(basePathOverride: Urls.url, interceptors: [AuthInterceptor()]);
  late Box<String> hive;

  initWebsocket() async {
    IO.Socket socket;
    if (Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isMacOS ||
        Platform.isLinux ||
        Platform.isWindows) {
      socket = IO.io(
          Urls.url, IO.OptionBuilder().setTransports(['websocket']).build());
    } else {
      socket = IO.io(Urls.url, IO.OptionBuilder().build());
    }

    socket.onConnect((data) {
      logger.i("Connected to websocket");
    });
    socket.on('post', (data) {
      logger.i('New Post');
      PostService.instance.getPosts();
    });
    socket.on('post/comment', (postId) {
      logger.i('New Comment');
      if (PostService.instance.selectedPost.value?.id == postId) {
        PostService.instance.getComments();
      }
    });

    socket.onConnectError((data) => print(data));
    socket.onConnectTimeout((data) => print(data));
  }

  logout() async {
    await hive.deleteFromDisk();
    await Hive.initFlutter();
    ChatService.instance.currentChat.value = null;
    ChatService.instance.conversations = [];
    ChatService.instance.filteredConversations.value = [];
    ChatService.instance.messagesNotifier.value = [];
    hive = await Hive.openBox<String>("default");
  }
}
