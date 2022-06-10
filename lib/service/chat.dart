import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/model/chat.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/constants.dart';
import 'package:openapi/openapi.dart';

class ChatService {
  static final instance = ChatService._();
  final appService = AppService.instance;
  ChatService._();

  var conversations = <Conversation>[];
  final filteredConversations = ValueNotifier<List<Conversation>>([]);

  final currentChat = ValueNotifier<Conversation?>(null);

  final messagesNotifier = ValueNotifier<List<Message>>([]);

  Future<void> getConversations() async {
    try {
      final response =
          await appService.api.getChatApi().chatControllerGetConversations();

      conversations = response.data
              ?.map((conversationDTO) => Conversation(
                  id: int.parse(conversationDTO.id.toString()),
                  participants: conversationDTO.participants
                      .map((participant) => ConversationParticipant(
                          id: int.parse(participant.id.toString()),
                          username: participant.username))
                      .toList()))
              .toList() ??
          [];

      appService.hive.put("conversations",
          jsonEncode(conversations.map((e) => e.toJson()).toList()));
      filteredConversations.value = conversations;
    } catch (e) {
      final conversationsString = appService.hive.get("conversations");
      if (conversationsString != null) {
        conversations = (jsonDecode(conversationsString) as List)
            .map((json) => Conversation.fromJson(json))
            .toList();
        filteredConversations.value = conversations;
      }
    }
  }

  Future<void> createConversation({required int partnerId}) async {
    final dto = CreateConversationRequestDTOBuilder()..partnerId = partnerId;
    await appService.api.getChatApi().chatControllerCreateConversation(
        createConversationRequestDTO: dto.build());

    await getConversations();
  }

  Future<void> sendMessage(
      {required int conversationId, required String message}) async {
    final dto = CreateMessageDTOBuilder()
      ..conversationId = conversationId
      ..content = message;
    await appService.api
        .getChatApi()
        .chatControllerSendMessage(createMessageDTO: dto.build());

    await getMessages(conversationId: conversationId);
  }

  Future<void> getMessages({required int conversationId}) async {
    List<Message> cachedMessages = [];
    final cachedMessagesString = appService.hive.get(conversationId.toString());
    if (cachedMessagesString != null) {
      cachedMessages = (jsonDecode(cachedMessagesString) as List)
          .map((e) => Message.fromJson(e))
          .toList();
    }
    List<Message> messages = cachedMessages;
    try {
      final dto = GetMessagesDTOBuilder()..conversationId = conversationId;
      if (cachedMessages.isNotEmpty) {
        dto.lastMessage = cachedMessages.first.id;
      }
      final response = await appService.api
          .getChatApi()
          .chatControllerGetMessages(getMessagesDTO: dto.build());

      final newMessages = response.data?.messages
              .map((message) => Message.fromResponseDTO(message))
              .toList() ??
          [];

      if (messages.isEmpty) {
        messages = newMessages.reversed.toList();
      } else {
        if (newMessages.isNotEmpty) {
          for (var message in newMessages) {
            if (!messages.any((m) => m.id == message.id)) {
              messages.add(message);
            }
          }

          messages.sort((a, b) => b.id - a.id);
        }
      }

      await appService.hive.delete("$conversationId");
      await appService.hive.put("$conversationId",
          jsonEncode(messages.map((m) => m.toJson()).toList()));
    } finally {
      messagesNotifier.value = messages;
    }
  }
}
