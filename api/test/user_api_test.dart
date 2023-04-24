import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UserApi
void main() {
  final instance = Openapi().getUserApi();

  group(UserApi, () {
    //Future usersControllerGetAvatar(num userId) async
    test('test usersControllerGetAvatar', () async {
      // TODO
    });

    //Future<UserResponseDTO> usersControllerGetMe() async
    test('test usersControllerGetMe', () async {
      // TODO
    });

    //Future<BuiltList<UserResponseDTO>> usersControllerGetUsers() async
    test('test usersControllerGetUsers', () async {
      // TODO
    });

    //Future usersControllerUploadAvatar({ MultipartFile file }) async
    test('test usersControllerUploadAvatar', () async {
      // TODO
    });

  });
}
