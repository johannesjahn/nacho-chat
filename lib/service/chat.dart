import 'dart:convert';

import 'package:built_collection/built_collection.dart';
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

  Future<void> createConversation({required List<num> partnerIds}) async {
    final dto = CreateConversationRequestDTOBuilder()
      ..partnerIds = ListBuilder(partnerIds.map((e) => e.toString()));
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

    await Future.wait([
      getMessages(conversationId: conversationId),
      getConversations(),
    ]);
  }

  Future<void> getMessages({required int conversationId}) async {
    try {
      final dto = GetMessagesDTOBuilder()..conversationId = conversationId;
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
