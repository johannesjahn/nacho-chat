//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_response_dto_author.g.dart';

/// The author of a post
///
/// Properties:
/// * [id] - The unique id of a user
/// * [username] - The username of a user
@BuiltValue()
abstract class PostResponseDTOAuthor implements UserResponseDTO, Built<PostResponseDTOAuthor, PostResponseDTOAuthorBuilder> {
  PostResponseDTOAuthor._();

  factory PostResponseDTOAuthor([void updates(PostResponseDTOAuthorBuilder b)]) = _$PostResponseDTOAuthor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostResponseDTOAuthorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostResponseDTOAuthor> get serializer => _$PostResponseDTOAuthorSerializer();
}

class _$PostResponseDTOAuthorSerializer implements PrimitiveSerializer<PostResponseDTOAuthor> {
  @override
  final Iterable<Type> types = const [PostResponseDTOAuthor, _$PostResponseDTOAuthor];

  @override
  final String wireName = r'PostResponseDTOAuthor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostResponseDTOAuthor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
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
    PostResponseDTOAuthor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostResponseDTOAuthorBuilder result,
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
  PostResponseDTOAuthor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostResponseDTOAuthorBuilder();
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

