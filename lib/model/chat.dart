import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/openapi.dart';

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

  factory Message.fromResponseDTO(MessageResponseDTO dto) => Message(
      id: int.parse(dto.id.toString()),
      content: dto.content,
      createdAt: dto.createdAt,
      author: MessageAuthor.fromUserDTO(dto.author));

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json["id"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        author: MessageAuthor.fromJson(json['author']));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "content": content,
      "createdAt": createdAt.toIso8601String(),
      "author": author.toJson(),
    };
  }
}

class MessageAuthor {
  int id;
  String username;

  MessageAuthor({required this.id, required this.username});

  factory MessageAuthor.fromUserDTO(UserResponseDTO dto) =>
      MessageAuthor(id: int.parse(dto.id.toString()), username: dto.username);

  factory MessageAuthor.fromJson(Map<String, dynamic> json) {
    return MessageAuthor(
      id: json["id"],
      username: json["username"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
    };
  }
}
