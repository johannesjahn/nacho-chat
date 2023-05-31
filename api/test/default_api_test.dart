import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DefaultApi
void main() {
  final instance = Openapi().getDefaultApi();

  group(DefaultApi, () {
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

    //Future statusMonitorControllerGetData() async
    test('test statusMonitorControllerGetData', () async {
      // TODO
    });

    //Future statusMonitorControllerRoot() async
    test('test statusMonitorControllerRoot', () async {
      // TODO
    });

  });
}
