import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AppApi
void main() {
  final instance = Openapi().getAppApi();

  group(AppApi, () {
    // 
    //
    // This is the debug endpoint. It just returns text.
    //
    //Future appControllerGetDebug() async
    test('test appControllerGetDebug', () async {
      // TODO
    });

    // 
    //
    // Get version of the current backend
    //
    //Future<VersionDTO> appControllerGetVersion() async
    test('test appControllerGetVersion', () async {
      // TODO
    });

  });
}
