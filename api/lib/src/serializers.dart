//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/change_password_dto.dart';
import 'package:openapi/src/model/comment_response_dto.dart';
import 'package:openapi/src/model/comment_response_dto_author.dart';
import 'package:openapi/src/model/conversation_response_dto.dart';
import 'package:openapi/src/model/conversation_response_dto_last_message.dart';
import 'package:openapi/src/model/create_comment_dto.dart';
import 'package:openapi/src/model/create_conversation_request_dto.dart';
import 'package:openapi/src/model/create_message_dto.dart';
import 'package:openapi/src/model/create_post_dto.dart';
import 'package:openapi/src/model/create_reply_dto.dart';
import 'package:openapi/src/model/delete_comment_dto.dart';
import 'package:openapi/src/model/delete_post_dto.dart';
import 'package:openapi/src/model/delete_reply_dto.dart';
import 'package:openapi/src/model/get_messages_dto.dart';
import 'package:openapi/src/model/has_unread_messages_response_dto.dart';
import 'package:openapi/src/model/login_dto.dart';
import 'package:openapi/src/model/login_response_dto.dart';
import 'package:openapi/src/model/mark_conversation_as_read_dto.dart';
import 'package:openapi/src/model/mark_message_as_read_dto.dart';
import 'package:openapi/src/model/message_response_dto.dart';
import 'package:openapi/src/model/number_of_unread_messages_response_dto.dart';
import 'package:openapi/src/model/post_response_dto.dart';
import 'package:openapi/src/model/post_response_dto_author.dart';
import 'package:openapi/src/model/register_dto.dart';
import 'package:openapi/src/model/reply_response_dto.dart';
import 'package:openapi/src/model/reply_response_dto_author.dart';
import 'package:openapi/src/model/update_comment_dto.dart';
import 'package:openapi/src/model/update_post_dto.dart';
import 'package:openapi/src/model/update_reply_dto.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:openapi/src/model/version_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  ChangePasswordDTO,
  CommentResponseDTO,
  CommentResponseDTOAuthor,
  ConversationResponseDTO,
  ConversationResponseDTOLastMessage,
  CreateCommentDTO,
  CreateConversationRequestDTO,
  CreateMessageDTO,
  CreatePostDTO,
  CreateReplyDTO,
  DeleteCommentDTO,
  DeletePostDTO,
  DeleteReplyDTO,
  GetMessagesDTO,
  HasUnreadMessagesResponseDTO,
  LoginDTO,
  LoginResponseDTO,
  MarkConversationAsReadDTO,
  MarkMessageAsReadDTO,
  MessageResponseDTO,$MessageResponseDTO,
  NumberOfUnreadMessagesResponseDTO,
  PostResponseDTO,
  PostResponseDTOAuthor,
  RegisterDTO,
  ReplyResponseDTO,
  ReplyResponseDTOAuthor,
  UpdateCommentDTO,
  UpdatePostDTO,
  UpdateReplyDTO,
  UserResponseDTO,$UserResponseDTO,
  VersionDTO,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserResponseDTO)]),
        () => ListBuilder<UserResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CommentResponseDTO)]),
        () => ListBuilder<CommentResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ReplyResponseDTO)]),
        () => ListBuilder<ReplyResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(PostResponseDTO)]),
        () => ListBuilder<PostResponseDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ConversationResponseDTO)]),
        () => ListBuilder<ConversationResponseDTO>(),
      )
      ..add(MessageResponseDTO.serializer)
      ..add(UserResponseDTO.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
