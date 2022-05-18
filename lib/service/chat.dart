import 'package:flutter/material.dart';
import 'package:nacho_chat/model/chat.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/constants.dart';

class ChatService {
  static final instance = ChatService._();
  final appService = AppService.instance;
  ChatService._();

  var conversations = <Conversation>[];
  final filteredConversations = ValueNotifier<List<Conversation>>([]);

  final currentChat = ValueNotifier<Conversation?>(null);

  final messagesNotifier = ValueNotifier<List<Message>>([]);

  Future<void> getConversations() async {
    final response = await appService.client.get(Urls.getConversations);

    conversations = (response.data as List)
        .map((json) => Conversation.fromJson(json))
        .toList();

    filteredConversations.value = conversations;
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
    final response = await appService.client
        .post(Urls.getMessages, data: {"conversationId": conversationId});

    final messages = (response.data["messages"] as List)
        .map((e) => Message.fromJson(e))
        .toList()
        .reversed
        .toList();

    messagesNotifier.value = messages;
  }
}
