import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Conversation with _$Conversation {
  factory Conversation({
    required int id,
    required List<ConversationParticipant> participants,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(
        json,
      );
}

@freezed
class ConversationParticipant with _$ConversationParticipant {
  factory ConversationParticipant({
    required int id,
    required String username,
  }) = _ConversationUser;

  factory ConversationParticipant.fromJson(Map<String, dynamic> json) =>
      _$ConversationParticipantFromJson(json);
}

class Message {
  int id;
  String content;
  DateTime createdAt;
  MessageAuthor author;

  Message({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.author,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json["id"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        author: MessageAuthor.fromJson(json['author']));
  }
}

class MessageAuthor {
  int id;
  String username;

  MessageAuthor({required this.id, required this.username});

  factory MessageAuthor.fromJson(Map<String, dynamic> json) {
    return MessageAuthor(
      id: json["id"],
      username: json["username"],
    );
  }
}
