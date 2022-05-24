import 'package:jwt_decode/jwt_decode.dart';
import 'package:nacho_chat/model/auth.dart';

import 'app.dart';
import 'constants.dart';

class AuthService {
  static final instance = AuthService._();
  final appService = AppService.instance;

  AuthService._();

  var _isActive = false;

  Future<bool> login(
      {required String username, required String password}) async {
    if (_isActive) return false;
    _isActive = true;
    try {
      final response = await appService.client.post(Urls.login, data: {
        "username": username,
        "password": password,
      });

      final data = LoginResponse.fromJson(response.data);
      final jwt = Jwt.parseJwt(data.access_token);

      appService.hive.put('access_token', data.access_token);
      appService.hive.put('username', jwt["username"]);
    } finally {
      _isActive = false;
    }
    return true;
  }

  Future<void> register(
      {required String username, required String password}) async {
    if (_isActive) return;
    _isActive = true;
    final response = await appService.client.post(Urls.register, data: {
      "username": username,
      "password": password,
    });
    _isActive = false;

    await login(username: username, password: password);
  }

  Future<void> logout() async {
    await appService.hive.delete('access_token');
    await appService.hive.delete('username');
  }
}
