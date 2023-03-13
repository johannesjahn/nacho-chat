//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/comment_response_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_response_dto.g.dart';

/// PostResponseDTO
///
/// Properties:
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [content] 
/// * [contentType] 
/// * [author] 
/// * [comments] 
@BuiltValue()
abstract class PostResponseDTO implements Built<PostResponseDTO, PostResponseDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  num get id;

  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'contentType')
  String get contentType;

  @BuiltValueField(wireName: r'author')
  UserResponseDTO? get author;

  @BuiltValueField(wireName: r'comments')
  BuiltList<CommentResponseDTO> get comments;

  PostResponseDTO._();

  factory PostResponseDTO([void updates(PostResponseDTOBuilder b)]) = _$PostResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostResponseDTO> get serializer => _$PostResponseDTOSerializer();
}

class _$PostResponseDTOSerializer implements PrimitiveSerializer<PostResponseDTO> {
  @override
  final Iterable<Type> types = const [PostResponseDTO, _$PostResponseDTO];

  @override
  final String wireName = r'PostResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostResponseDTO object, {
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
      specifiedType: const FullType(String),
    );
    yield r'author';
    yield object.author == null ? null : serializers.serialize(
      object.author,
      specifiedType: const FullType.nullable(UserResponseDTO),
    );
    yield r'comments';
    yield serializers.serialize(
      object.comments,
      specifiedType: const FullType(BuiltList, [FullType(CommentResponseDTO)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PostResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostResponseDTOBuilder result,
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
            specifiedType: const FullType(String),
          ) as String;
          result.contentType = valueDes;
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserResponseDTO),
          ) as UserResponseDTO?;
          if (valueDes == null) continue;
          result.author.replace(valueDes);
          break;
        case r'comments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CommentResponseDTO)]),
          ) as BuiltList<CommentResponseDTO>;
          result.comments.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostResponseDTOBuilder();
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

