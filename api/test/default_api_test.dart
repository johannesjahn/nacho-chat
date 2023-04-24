import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DefaultApi
void main() {
  final instance = Openapi().getDefaultApi();

  group(DefaultApi, () {
    //Future appControllerGetDebug() async
    test('test appControllerGetDebug', () async {
      // TODO
    });

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
