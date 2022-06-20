//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/comment_response_dto.dart';
import 'package:openapi/src/model/conversation_response_dto.dart';
import 'package:openapi/src/model/create_comment_dto.dart';
import 'package:openapi/src/model/create_conversation_request_dto.dart';
import 'package:openapi/src/model/create_message_dto.dart';
import 'package:openapi/src/model/create_post_dto.dart';
import 'package:openapi/src/model/create_reply_dto.dart';
import 'package:openapi/src/model/delete_comment_dto.dart';
import 'package:openapi/src/model/delete_post_dto.dart';
import 'package:openapi/src/model/delete_reply_dto.dart';
import 'package:openapi/src/model/get_comments_dto.dart';
import 'package:openapi/src/model/get_messages_dto.dart';
import 'package:openapi/src/model/get_replies_dto.dart';
import 'package:openapi/src/model/login_dto.dart';
import 'package:openapi/src/model/login_response_dto.dart';
import 'package:openapi/src/model/message_response_dto.dart';
import 'package:openapi/src/model/post_response_dto.dart';
import 'package:openapi/src/model/register_dto.dart';
import 'package:openapi/src/model/reply_response_dto.dart';
import 'package:openapi/src/model/update_comment_dto.dart';
import 'package:openapi/src/model/update_post_dto.dart';
import 'package:openapi/src/model/update_reply_dto.dart';
import 'package:openapi/src/model/user_response_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  CommentResponseDTO,
  ConversationResponseDTO,
  CreateCommentDTO,
  CreateConversationRequestDTO,
  CreateMessageDTO,
  CreatePostDTO,
  CreateReplyDTO,
  DeleteCommentDTO,
  DeletePostDTO,
  DeleteReplyDTO,
  GetCommentsDTO,
  GetMessagesDTO,
  GetRepliesDTO,
  LoginDTO,
  LoginResponseDTO,
  MessageResponseDTO,
  PostResponseDTO,
  RegisterDTO,
  ReplyResponseDTO,
  UpdateCommentDTO,
  UpdatePostDTO,
  UpdateReplyDTO,
  UserResponseDTO,
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
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
