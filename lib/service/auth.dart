import 'package:jwt_decode/jwt_decode.dart';
import 'package:openapi/openapi.dart';

import 'app.dart';

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
      final loginDTO = LoginDTOBuilder()
        ..username = username
        ..password = password;
      final response = await appService.api
          .getAuthApi()
          .authControllerLogin(loginDTO: loginDTO.build());

      if (response.data?.accessToken == null) {
        throw Exception("No access token");
      }
      final jwt = Jwt.parseJwt(response.data!.accessToken);
      appService.hive.put('access_token', response.data!.accessToken);
      appService.hive.put('username', jwt["username"]);
      appService.initWebsocket();
    } finally {
      _isActive = false;
    }
    return true;
  }

  Future<void> register(
      {required String username, required String password}) async {
    if (_isActive) return;
    _isActive = true;
    final registerDTO = RegisterDTOBuilder()
      ..username = username
      ..password = password;
    await appService.api
        .getAuthApi()
        .authControllerRegister(registerDTO: registerDTO.build());
    _isActive = false;

    await login(username: username, password: password);
  }
}
