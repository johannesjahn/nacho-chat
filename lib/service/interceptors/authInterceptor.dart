import 'package:dio/dio.dart';
import 'package:nacho_chat/service/app.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = AppService.instance.accessToken;
    if (token != null) {
      return handler.next(options.copyWith(headers: {
        "Authorization": "Bearer $token",
      }));
    }

    return handler.next(options);
  }
}
