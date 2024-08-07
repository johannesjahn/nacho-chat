//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_response_dto.g.dart';

/// MessageResponseDTO
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
abstract class MessageResponseDTO implements Built<MessageResponseDTO, MessageResponseDTOBuilder> {
  /// The id of the message
  @BuiltValueField(wireName: r'id')
  num get id;

  /// The creation date of a message
  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// The date of the last update of a message
  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  /// The content of the message
  @BuiltValueField(wireName: r'content')
  String get content;

  /// The type of content
  @BuiltValueField(wireName: r'contentType')
  MessageResponseDTOContentTypeEnum get contentType;
  // enum contentTypeEnum {  TEXT,  IMAGE_URL,  };

  /// The author of the message
  @BuiltValueField(wireName: r'author')
  UserResponseDTO get author;

  /// The users that have read the message
  @BuiltValueField(wireName: r'readBy')
  BuiltList<UserResponseDTO> get readBy;

  MessageResponseDTO._();

  factory MessageResponseDTO([void updates(MessageResponseDTOBuilder b)]) = _$MessageResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessageResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessageResponseDTO> get serializer => _$MessageResponseDTOSerializer();
}

class _$MessageResponseDTOSerializer implements PrimitiveSerializer<MessageResponseDTO> {
  @override
  final Iterable<Type> types = const [MessageResponseDTO, _$MessageResponseDTO];

  @override
  final String wireName = r'MessageResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessageResponseDTO object, {
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
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'contentType';
    yield serializers.serialize(
      object.contentType,
      specifiedType: const FullType(MessageResponseDTOContentTypeEnum),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    MessageResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessageResponseDTOBuilder result,
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
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'contentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MessageResponseDTOContentTypeEnum),
          ) as MessageResponseDTOContentTypeEnum;
          result.contentType = valueDes;
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserResponseDTO),
          ) as UserResponseDTO;
          result.author.replace(valueDes);
          break;
        case r'readBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserResponseDTO)]),
          ) as BuiltList<UserResponseDTO>;
          result.readBy.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MessageResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessageResponseDTOBuilder();
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

class MessageResponseDTOContentTypeEnum extends EnumClass {

  /// The type of content
  @BuiltValueEnumConst(wireName: r'TEXT')
  static const MessageResponseDTOContentTypeEnum TEXT = _$messageResponseDTOContentTypeEnum_TEXT;
  /// The type of content
  @BuiltValueEnumConst(wireName: r'IMAGE_URL')
  static const MessageResponseDTOContentTypeEnum IMAGE_URL = _$messageResponseDTOContentTypeEnum_IMAGE_URL;

  static Serializer<MessageResponseDTOContentTypeEnum> get serializer => _$messageResponseDTOContentTypeEnumSerializer;

  const MessageResponseDTOContentTypeEnum._(String name): super(name);

  static BuiltSet<MessageResponseDTOContentTypeEnum> get values => _$messageResponseDTOContentTypeEnumValues;
  static MessageResponseDTOContentTypeEnum valueOf(String name) => _$messageResponseDTOContentTypeEnumValueOf(name);
}

