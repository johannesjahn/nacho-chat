import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for GetMessagesDTO
void main() {
  final instance = GetMessagesDTOBuilder();
  // TODO add properties to the builder and call build()

  group(GetMessagesDTO, () {
    // num conversationId
    test('to test the property `conversationId`', () async {
      // TODO
    });

    // To reduce the amount of data fetched the client can send the id of the last received message and only get messages that are newer than that
    // num lastMessage
    test('to test the property `lastMessage`', () async {
      // TODO
    });

  });
}
