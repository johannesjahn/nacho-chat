import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UserApi
void main() {
  final instance = Openapi().getUserApi();

  group(UserApi, () {
    // 
    //
    // Get avatar for a specific user
    //
    //Future usersControllerGetAvatar(num userId) async
    test('test usersControllerGetAvatar', () async {
      // TODO
    });

    // 
    //
    // Get current authenticated user
    //
    //Future<UserResponseDTO> usersControllerGetMe() async
    test('test usersControllerGetMe', () async {
      // TODO
    });

    // 
    //
    // Get all users without self
    //
    //Future<BuiltList<UserResponseDTO>> usersControllerGetUsers() async
    test('test usersControllerGetUsers', () async {
      // TODO
    });

    // 
    //
    // Upload avatar for current authenticated user
    //
    //Future usersControllerUploadAvatar({ MultipartFile file }) async
    test('test usersControllerUploadAvatar', () async {
      // TODO
    });

  });
}
