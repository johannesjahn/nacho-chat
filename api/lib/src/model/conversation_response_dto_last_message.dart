//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:openapi/src/model/message_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'conversation_response_dto_last_message.g.dart';

/// The last message that was sent within a conversation
///
/// Properties:
/// * [id] - The id of the message
/// * [createdAt] - The creation date of a message
/// * [updatedAt] - The date of the last update of a message
/// * [content] - The content of the message
/// * [contentType] - The type of content
/// * [author] - The author of the message
/// * [readBy] - The users that have read the message
@BuiltValue()
abstract class ConversationResponseDTOLastMessage implements MessageResponseDTO, Built<ConversationResponseDTOLastMessage, ConversationResponseDTOLastMessageBuilder> {
  ConversationResponseDTOLastMessage._();

  factory ConversationResponseDTOLastMessage([void updates(ConversationResponseDTOLastMessageBuilder b)]) = _$ConversationResponseDTOLastMessage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConversationResponseDTOLastMessageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConversationResponseDTOLastMessage> get serializer => _$ConversationResponseDTOLastMessageSerializer();
}

class _$ConversationResponseDTOLastMessageSerializer implements PrimitiveSerializer<ConversationResponseDTOLastMessage> {
  @override
  final Iterable<Type> types = const [ConversationResponseDTOLastMessage, _$ConversationResponseDTOLastMessage];

  @override
  final String wireName = r'ConversationResponseDTOLastMessage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConversationResponseDTOLastMessage object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'author';
    yield serializers.serialize(
      object.author,
      specifiedType: const FullType(UserResponseDTO),
    );
    yield r'readBy';
    yield serializers.serialize(
      object.readBy,
      specifiedType: const FullType(BuiltList, [FullType(UserResponseDTO)]),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
    );
    yield r'contentType';
    yield serializers.serialize(
      object.contentType,
      specifiedType: const FullType(MessageResponseDTOContentTypeEnum),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConversationResponseDTOLastMessage object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConversationResponseDTOLastMessageBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserResponseDTO),
          ) as UserResponseDTO;
          result.author = valueDes;
          break;
        case r'readBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserResponseDTO)]),
          ) as BuiltList<UserResponseDTO>;
          result.readBy.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.id = valueDes;
          break;
        case r'contentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MessageResponseDTOContentTypeEnum),
          ) as MessageResponseDTOContentTypeEnum;
          result.contentType = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConversationResponseDTOLastMessage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConversationResponseDTOLastMessageBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class ConversationResponseDTOLastMessageContentTypeEnum extends EnumClass {

  /// The type of content
  @BuiltValueEnumConst(wireName: r'TEXT')
  static const ConversationResponseDTOLastMessageContentTypeEnum TEXT = _$conversationResponseDTOLastMessageContentTypeEnum_TEXT;
  /// The type of content
  @BuiltValueEnumConst(wireName: r'IMAGE_URL')
  static const ConversationResponseDTOLastMessageContentTypeEnum IMAGE_URL = _$conversationResponseDTOLastMessageContentTypeEnum_IMAGE_URL;

  static Serializer<ConversationResponseDTOLastMessageContentTypeEnum> get serializer => _$conversationResponseDTOLastMessageContentTypeEnumSerializer;

  const ConversationResponseDTOLastMessageContentTypeEnum._(String name): super(name);

  static BuiltSet<ConversationResponseDTOLastMessageContentTypeEnum> get values => _$conversationResponseDTOLastMessageContentTypeEnumValues;
  static ConversationResponseDTOLastMessageContentTypeEnum valueOf(String name) => _$conversationResponseDTOLastMessageContentTypeEnumValueOf(name);
}

