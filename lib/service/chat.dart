import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:openapi/openapi.dart';

class ChatService {
  static final instance = ChatService._();
  final appService = AppService.instance;
  ChatService._();

  var conversations = <ConversationResponseDTO>[];
  final filteredConversations =
      ValueNotifier<List<ConversationResponseDTO>>([]);

  final currentChat = ValueNotifier<ConversationResponseDTO?>(null);

  final messagesNotifier = ValueNotifier<List<MessageResponseDTO>>([]);

  Future<void> getConversations() async {
    final response =
        await appService.api.getChatApi().chatControllerGetConversations();

    conversations = response.data?.toList() ?? [];
    filteredConversations.value = conversations;
  }

  Future<void> createConversation({required num partnerId}) async {
    final dto = CreateConversationRequestDTOBuilder()..partnerId = partnerId;
    await appService.api.getChatApi().chatControllerCreateConversation(
        createConversationRequestDTO: dto.build());

    await getConversations();
  }

  Future<void> sendMessage(
      {required int conversationId,
      required String message,
      String contentType = 'TEXT'}) async {
    final dto = CreateMessageDTOBuilder()
      ..conversationId = conversationId
      ..content = message
      ..contentType = contentType;
    await appService.api
        .getChatApi()
        .chatControllerSendMessage(createMessageDTO: dto.build());

    await getMessages(conversationId: conversationId);
  }

  Future<void> getMessages({required int conversationId}) async {
    List<MessageResponseDTO> cachedMessages = [];
    final cachedMessagesString = appService.hive.get(conversationId.toString());
    await appService.hive.delete("$conversationId");

    try {
      final dto = GetMessagesDTOBuilder()..conversationId = conversationId;
      if (cachedMessages.isNotEmpty) {
        //dto.lastMessage = cachedMessages.first.id;
      }
      final response = await appService.api
          .getChatApi()
          .chatControllerGetMessages(getMessagesDTO: dto.build());

      var messages = response.data?.messages.reversed.toList() ?? [];
      final List<MessageResponseDTO> newMessages = [];

      if (messages.isEmpty) {
        messages = newMessages.reversed.toList();
      } else {
        if (newMessages.isNotEmpty) {
          for (var message in newMessages) {
            if (!messages.any((m) => m.id == message.id)) {
              messages.add(message);
            }
          }
          messages.sort((a, b) => (b.id - a.id).toInt());
        }
      }

      messagesNotifier.value = messages;
    } finally {}
  }
}
