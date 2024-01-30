import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:openapi/openapi.dart';

class ChatService {
  static final instance = ChatService._();
  final appService = AppService.instance;
  final scrollController = ScrollController();
  ChatService._();

  var conversations = <ConversationResponseDTO>[];
  final filteredConversations =
      ValueNotifier<List<ConversationResponseDTO>>([]);

  final currentChat = ValueNotifier<ConversationResponseDTO?>(null);

  final messagesNotifier = ValueNotifier<List<MessageResponseDTO>>([]);

  final unreadCountNotifier = ValueNotifier<num>(0);

  Future<void> getConversations() async {
    final response =
        await appService.api.getChatApi().chatControllerGetConversations();

    conversations = response.data?.toList() ?? [];
    filteredConversations.value = conversations;
  }

  Future<void> createConversation({required List<num> partnerIds}) async {
    final dto = CreateConversationRequestDTOBuilder()
      ..partnerIds = ListBuilder(partnerIds.map((e) => e));
    await appService.api.getChatApi().chatControllerCreateConversation(
        createConversationRequestDTO: dto.build());

    await getConversations();
  }

  Future<void> sendMessage(
      {required int conversationId,
      required String message,
      CreateMessageDTOContentTypeEnum contentType =
          CreateMessageDTOContentTypeEnum.TEXT}) async {
    final dto = CreateMessageDTOBuilder()
      ..conversationId = conversationId
      ..content = message
      ..contentType = contentType;
    await appService.api
        .getChatApi()
        .chatControllerSendMessage(createMessageDTO: dto.build());

    await Future.wait([
      getMessages(conversationId: conversationId),
      getConversations(),
    ]);
  }

  Future<void> getMessages({required int conversationId}) async {
    try {
      List<MessageResponseDTO> messages = [];
      final dto = GetMessagesDTOBuilder()..conversationId = conversationId;
      if (currentChat.value?.id == conversationId &&
          messagesNotifier.value.isNotEmpty) {
        messages.addAll(messagesNotifier.value);
        dto.lastMessage = messages.first.id;
      }

      final response = await appService.api
          .getChatApi()
          .chatControllerGetMessages(getMessagesDTO: dto.build());

      var newMessages = response.data?.messages.toList() ?? [];

      if (messages.isEmpty) {
        messages = newMessages.toList();
      } else {
        if (newMessages.isNotEmpty) {
          for (var message in newMessages) {
            if (!messages.any((m) => m.id == message.id)) {
              messages.add(message);
            }
          }
        }
      }
      messages.sort((a, b) => (b.id - a.id).toInt());

      messagesNotifier.value = messages;
    } finally {}
  }

  Future<void> markConversationAsRead({required int conversationId}) async {
    final dto = MarkConversationAsReadDTOBuilder()
      ..conversationId = conversationId;
    await appService.api.getChatApi().chatControllerMarkConversationAsRead(
        markConversationAsReadDTO: dto.build());

    await Future.wait([
      getMessages(conversationId: conversationId),
      getConversations(),
    ]);

    getNumberOfUnreadMessages();
  }

  Future<num> getNumberOfUnreadMessages() async {
    final response = await appService.api
        .getChatApi()
        .chatControllerGetNumberOfUnreadMessages();

    unreadCountNotifier.value = response.data?.count ?? 0;
    return response.data?.count ?? 0;
  }
}
