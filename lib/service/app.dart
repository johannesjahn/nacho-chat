import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nacho_chat/firebase_options.dart';
import 'package:nacho_chat/service/interceptors/authInterceptor.dart';

class AppService {
  static final instance = AppService._();

  bool isTablet = false;

  Future<void> init() async {
    await Hive.initFlutter();
    hive = await Hive.openBox<String>("default");

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final token = await FirebaseMessaging.instance.getToken();
    print(token);
  }

  AppService._() {
    client.interceptors.add(AuthInterceptor());
  }

  final client = Dio();
  late final Box<String> hive;
}
