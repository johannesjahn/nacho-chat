import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    //Future<LoginResponseDTO> authControllerLogin(LoginDTO loginDTO) async
    test('test authControllerLogin', () async {
      // TODO
    });

    //Future<UserResponseDTO> authControllerRegister(RegisterDTO registerDTO) async
    test('test authControllerRegister', () async {
      // TODO
    });

  });
}
