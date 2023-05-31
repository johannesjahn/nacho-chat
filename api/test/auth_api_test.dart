import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    // 
    //
    // Change password
    //
    //Future<BuiltList<UserResponseDTO>> authControllerGetUsers(ChangePasswordDTO changePasswordDTO) async
    test('test authControllerGetUsers', () async {
      // TODO
    });

    // 
    //
    // Login with username and password
    //
    //Future<LoginResponseDTO> authControllerLogin(LoginDTO loginDTO) async
    test('test authControllerLogin', () async {
      // TODO
    });

    // 
    //
    // Register a new user
    //
    //Future<UserResponseDTO> authControllerRegister(RegisterDTO registerDTO) async
    test('test authControllerRegister', () async {
      // TODO
    });

  });
}
