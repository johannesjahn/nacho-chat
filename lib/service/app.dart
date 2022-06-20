import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:nacho_chat/service/interceptors/authInterceptor.dart';
import 'package:openapi/openapi.dart';

export 'utils.dart';

class AppService {
  static final instance = AppService._();

  bool isTablet = false;

  Future<void> init() async {
    await Hive.initFlutter();
    hive = await Hive.openBox<String>("default");
  }

  AppService._();

  final api = Openapi(
      basePathOverride: "http://localhost:3000/",
      interceptors: [AuthInterceptor()]);
  late Box<String> hive;

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
