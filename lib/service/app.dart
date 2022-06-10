import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  AppService._() {
    this.client.interceptors.add(AuthInterceptor());
  }

  final api = Openapi(
      basePathOverride: "https://chat.johannes-jahn.com/",
      interceptors: [AuthInterceptor()]);
  late final Box<String> hive;
  final client = Dio();
}
