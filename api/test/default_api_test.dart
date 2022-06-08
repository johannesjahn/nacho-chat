import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DefaultApi
void main() {
  final instance = Openapi().getDefaultApi();

  group(DefaultApi, () {
    //Future<UserResponseDTO> appControllerGetAnyUser() async
    test('test appControllerGetAnyUser', () async {
      // TODO
    });

    //Future appControllerGetHello() async
    test('test appControllerGetHello', () async {
      // TODO
    });

  });
}
