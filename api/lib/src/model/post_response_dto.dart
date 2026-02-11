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
/// * [id] - The unique id of a post
/// * [createdAt] - The creation date of a post
/// * [updatedAt] - The last update date of a post
/// * [content] - The content of a post
/// * [contentType] - The content type of a post
/// * [author] - The author of a post
/// * [comments] - The comments of a post
/// * [likes] - Number of likes
/// * [liked] - Liked by current user
/// * [numberOfComments] - Number of comments and replies in a post
@BuiltValue()
abstract class PostResponseDTO implements Built<PostResponseDTO, PostResponseDTOBuilder> {
  /// The unique id of a post
  @BuiltValueField(wireName: r'id')
  num get id;

  /// The creation date of a post
  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// The last update date of a post
  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  /// The content of a post
  @BuiltValueField(wireName: r'content')
  String get content;

  /// The content type of a post
  @BuiltValueField(wireName: r'contentType')
  PostResponseDTOContentTypeEnum get contentType;
  // enum contentTypeEnum {  TEXT,  IMAGE_URL,  AUDIO_URL,  };

  /// The author of a post
  @BuiltValueField(wireName: r'author')
  UserResponseDTO? get author;

  /// The comments of a post
  @BuiltValueField(wireName: r'comments')
  BuiltList<CommentResponseDTO>? get comments;

  /// Number of likes
  @BuiltValueField(wireName: r'likes')
  num get likes;

  /// Liked by current user
  @BuiltValueField(wireName: r'liked')
  bool get liked;

  /// Number of comments and replies in a post
  @BuiltValueField(wireName: r'numberOfComments')
  num? get numberOfComments;

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
      specifiedType: const FullType(PostResponseDTOContentTypeEnum),
    );
    yield r'author';
    yield object.author == null ? null : serializers.serialize(
      object.author,
      specifiedType: const FullType.nullable(UserResponseDTO),
    );
    yield r'comments';
    yield object.comments == null ? null : serializers.serialize(
      object.comments,
      specifiedType: const FullType.nullable(BuiltList, [FullType(CommentResponseDTO)]),
    );
    yield r'likes';
    yield serializers.serialize(
      object.likes,
      specifiedType: const FullType(num),
    );
    yield r'liked';
    yield serializers.serialize(
      object.liked,
      specifiedType: const FullType(bool),
    );
    yield r'numberOfComments';
    yield object.numberOfComments == null ? null : serializers.serialize(
      object.numberOfComments,
      specifiedType: const FullType.nullable(num),
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
            specifiedType: const FullType(PostResponseDTOContentTypeEnum),
          ) as PostResponseDTOContentTypeEnum;
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(CommentResponseDTO)]),
          ) as BuiltList<CommentResponseDTO>?;
          if (valueDes == null) continue;
          result.comments.replace(valueDes);
          break;
        case r'likes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.likes = valueDes;
          break;
        case r'liked':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.liked = valueDes;
          break;
        case r'numberOfComments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.numberOfComments = valueDes;
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

class PostResponseDTOContentTypeEnum extends EnumClass {

  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'TEXT')
  static const PostResponseDTOContentTypeEnum TEXT = _$postResponseDTOContentTypeEnum_TEXT;
  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'IMAGE_URL')
  static const PostResponseDTOContentTypeEnum IMAGE_URL = _$postResponseDTOContentTypeEnum_IMAGE_URL;
  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'AUDIO_URL')
  static const PostResponseDTOContentTypeEnum AUDIO_URL = _$postResponseDTOContentTypeEnum_AUDIO_URL;

  static Serializer<PostResponseDTOContentTypeEnum> get serializer => _$postResponseDTOContentTypeEnumSerializer;

  const PostResponseDTOContentTypeEnum._(String name): super(name);

  static BuiltSet<PostResponseDTOContentTypeEnum> get values => _$postResponseDTOContentTypeEnumValues;
  static PostResponseDTOContentTypeEnum valueOf(String name) => _$postResponseDTOContentTypeEnumValueOf(name);
}

