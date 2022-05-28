import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/model/chat.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/constants.dart';
import 'dart:convert';

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
      final response = await appService.client.get(Urls.getConversations);

      conversations = (response.data as List)
          .map((json) => Conversation.fromJson(json))
          .toList();

      appService.hive.put("conversations", jsonEncode(response.data));
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
    final response = await appService.client
        .post(Urls.createConversation, data: {"partnerId": partnerId});

    final conversation = Conversation.fromJson(response.data);
    await getConversations();
  }

  Future<void> sendMessage(
      {required int conversationId, required String message}) async {
    final response = await appService.client.post(Urls.sendMessage,
        data: {"conversationId": conversationId, "content": message});

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
      Response response;

      if (cachedMessages.isEmpty) {
        response = await appService.client
            .post(Urls.getMessages, data: {"conversationId": conversationId});
      } else {
        response = await appService.client.post(Urls.getMessages, data: {
          "conversationId": conversationId,
          "lastMessage": cachedMessages.first.id
        });
      }

      if (messages.isEmpty) {
        messages = (response.data["messages"] as List)
            .map((e) => Message.fromJson(e))
            .toList()
            .reversed
            .toList();
      } else {
        final responseMessages = (response.data["messages"] as List)
            .map((e) => Message.fromJson(e))
            .toList();

        if (responseMessages.isNotEmpty) {
          for (var message in responseMessages) {
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
