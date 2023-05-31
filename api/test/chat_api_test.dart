import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ChatApi
void main() {
  final instance = Openapi().getChatApi();

  group(ChatApi, () {
    // 
    //
    // Endpoint to create a new conversation with two or more participants (authenticated user is automatically added to the conversation)
    //
    //Future<ConversationResponseDTO> chatControllerCreateConversation(CreateConversationRequestDTO createConversationRequestDTO) async
    test('test chatControllerCreateConversation', () async {
      // TODO
    });

    // 
    //
    // Endpoint to get all conversations for the authenticated user
    //
    //Future<BuiltList<ConversationResponseDTO>> chatControllerGetConversations() async
    test('test chatControllerGetConversations', () async {
      // TODO
    });

    // 
    //
    // Endpoint to get messages relevant for the authenticated user
    //
    //Future<ConversationResponseDTO> chatControllerGetMessages(GetMessagesDTO getMessagesDTO) async
    test('test chatControllerGetMessages', () async {
      // TODO
    });

    // 
    //
    // Send a message to a conversation
    //
    //Future<MessageResponseDTO> chatControllerSendMessage(CreateMessageDTO createMessageDTO) async
    test('test chatControllerSendMessage', () async {
      // TODO
    });

  });
}
