//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:openapi/src/model/message_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'conversation_response_dto.g.dart';

/// ConversationResponseDTO
///
/// Properties:
/// * [id] - The id of the conversation
/// * [createdAt] - The creation date of the conversation
/// * [updatedAt] - The date of the last update of the conversation
/// * [title] - The title of the conversation
/// * [participants] - The participants of the conversation
/// * [messages] - The messages belonging to the conversation
/// * [lastMessage] - The last message that was sent within a conversation
@BuiltValue()
abstract class ConversationResponseDTO implements Built<ConversationResponseDTO, ConversationResponseDTOBuilder> {
  /// The id of the conversation
  @BuiltValueField(wireName: r'id')
  num get id;

  /// The creation date of the conversation
  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// The date of the last update of the conversation
  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  /// The title of the conversation
  @BuiltValueField(wireName: r'title')
  String? get title;

  /// The participants of the conversation
  @BuiltValueField(wireName: r'participants')
  BuiltList<UserResponseDTO> get participants;

  /// The messages belonging to the conversation
  @BuiltValueField(wireName: r'messages')
  BuiltList<MessageResponseDTO> get messages;

  /// The last message that was sent within a conversation
  @BuiltValueField(wireName: r'lastMessage')
  MessageResponseDTO? get lastMessage;

  ConversationResponseDTO._();

  factory ConversationResponseDTO([void updates(ConversationResponseDTOBuilder b)]) = _$ConversationResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConversationResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConversationResponseDTO> get serializer => _$ConversationResponseDTOSerializer();
}

class _$ConversationResponseDTOSerializer implements PrimitiveSerializer<ConversationResponseDTO> {
  @override
  final Iterable<Type> types = const [ConversationResponseDTO, _$ConversationResponseDTO];

  @override
  final String wireName = r'ConversationResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConversationResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    yield r'participants';
    yield serializers.serialize(
      object.participants,
      specifiedType: const FullType(BuiltList, [FullType(UserResponseDTO)]),
    );
    yield r'messages';
    yield serializers.serialize(
      object.messages,
      specifiedType: const FullType(BuiltList, [FullType(MessageResponseDTO)]),
    );
    yield r'lastMessage';
    yield object.lastMessage == null ? null : serializers.serialize(
      object.lastMessage,
      specifiedType: const FullType.nullable(MessageResponseDTO),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConversationResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConversationResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.id = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'participants':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserResponseDTO)]),
          ) as BuiltList<UserResponseDTO>;
          result.participants.replace(valueDes);
          break;
        case r'messages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MessageResponseDTO)]),
          ) as BuiltList<MessageResponseDTO>;
          result.messages.replace(valueDes);
          break;
        case r'lastMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MessageResponseDTO),
          ) as MessageResponseDTO?;
          if (valueDes == null) continue;
          result.lastMessage.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConversationResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConversationResponseDTOBuilder();
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

