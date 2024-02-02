//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_response_dto_author.g.dart';

/// The author of a comment
///
/// Properties:
/// * [id] - The unique id of a user
/// * [username] - The username of a user
/// * [avatarHash] - The avatar hash of a user
@BuiltValue()
abstract class CommentResponseDTOAuthor implements UserResponseDTO, Built<CommentResponseDTOAuthor, CommentResponseDTOAuthorBuilder> {
  CommentResponseDTOAuthor._();

  factory CommentResponseDTOAuthor([void updates(CommentResponseDTOAuthorBuilder b)]) = _$CommentResponseDTOAuthor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommentResponseDTOAuthorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentResponseDTOAuthor> get serializer => _$CommentResponseDTOAuthorSerializer();
}

class _$CommentResponseDTOAuthorSerializer implements PrimitiveSerializer<CommentResponseDTOAuthor> {
  @override
  final Iterable<Type> types = const [CommentResponseDTOAuthor, _$CommentResponseDTOAuthor];

  @override
  final String wireName = r'CommentResponseDTOAuthor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommentResponseDTOAuthor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
    );
    yield r'avatarHash';
    yield object.avatarHash == null ? null : serializers.serialize(
      object.avatarHash,
      specifiedType: const FullType.nullable(String),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CommentResponseDTOAuthor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommentResponseDTOAuthorBuilder result,
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
        case r'avatarHash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatarHash = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CommentResponseDTOAuthor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentResponseDTOAuthorBuilder();
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

