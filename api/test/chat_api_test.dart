import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ChatApi
void main() {
  final instance = Openapi().getChatApi();

  group(ChatApi, () {
    //Future<ConversationResponseDTO> chatControllerCreateConversation(CreateConversationRequestDTO createConversationRequestDTO) async
    test('test chatControllerCreateConversation', () async {
      // TODO
    });

    //Future<BuiltList<ConversationResponseDTO>> chatControllerGetConversations() async
    test('test chatControllerGetConversations', () async {
      // TODO
    });

    //Future<ConversationResponseDTO> chatControllerGetMessages(GetMessagesDTO getMessagesDTO) async
    test('test chatControllerGetMessages', () async {
      // TODO
    });

    //Future<MessageResponseDTO> chatControllerSendMessage(CreateMessageDTO createMessageDTO) async
    test('test chatControllerSendMessage', () async {
      // TODO
    });

  });
}
