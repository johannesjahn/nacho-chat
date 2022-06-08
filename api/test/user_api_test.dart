import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UserApi
void main() {
  final instance = Openapi().getUserApi();

  group(UserApi, () {
    //Future<BuiltList<UserResponseDTO>> usersControllerGetUsers() async
    test('test usersControllerGetUsers', () async {
      // TODO
    });

  });
}
