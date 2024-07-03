//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reply_response_dto.g.dart';

/// ReplyResponseDTO
///
/// Properties:
/// * [id] - The unique id of a reply
/// * [createdAt] - The creation date of a reply
/// * [updatedAt] - The last update date of a reply
/// * [content] - The content of a reply
/// * [author] - The author of a reply
/// * [likes] - Number of likes
@BuiltValue()
abstract class ReplyResponseDTO implements Built<ReplyResponseDTO, ReplyResponseDTOBuilder> {
  /// The unique id of a reply
  @BuiltValueField(wireName: r'id')
  num get id;

  /// The creation date of a reply
  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// The last update date of a reply
  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  /// The content of a reply
  @BuiltValueField(wireName: r'content')
  String get content;

  /// The author of a reply
  @BuiltValueField(wireName: r'author')
  UserResponseDTO? get author;

  /// Number of likes
  @BuiltValueField(wireName: r'likes')
  num get likes;

  ReplyResponseDTO._();

  factory ReplyResponseDTO([void updates(ReplyResponseDTOBuilder b)]) = _$ReplyResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReplyResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReplyResponseDTO> get serializer => _$ReplyResponseDTOSerializer();
}

class _$ReplyResponseDTOSerializer implements PrimitiveSerializer<ReplyResponseDTO> {
  @override
  final Iterable<Type> types = const [ReplyResponseDTO, _$ReplyResponseDTO];

  @override
  final String wireName = r'ReplyResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReplyResponseDTO object, {
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
    yield r'author';
    yield object.author == null ? null : serializers.serialize(
      object.author,
      specifiedType: const FullType.nullable(UserResponseDTO),
    );
    yield r'likes';
    yield serializers.serialize(
      object.likes,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReplyResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReplyResponseDTOBuilder result,
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
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserResponseDTO),
          ) as UserResponseDTO?;
          if (valueDes == null) continue;
          result.author.replace(valueDes);
          break;
        case r'likes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.likes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReplyResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReplyResponseDTOBuilder();
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

