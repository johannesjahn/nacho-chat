//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:openapi/src/model/reply_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_response_dto.g.dart';

/// CommentResponseDTO
///
/// Properties:
/// * [id] - The unique id of a comment
/// * [createdAt] - The creation date of a comment
/// * [updatedAt] - The last update date of a comment
/// * [content] - The content of a comment
/// * [author] - The author of a comment
/// * [replies] - The replies of a comment
/// * [likes] - Number of likes
@BuiltValue()
abstract class CommentResponseDTO implements Built<CommentResponseDTO, CommentResponseDTOBuilder> {
  /// The unique id of a comment
  @BuiltValueField(wireName: r'id')
  num get id;

  /// The creation date of a comment
  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  /// The last update date of a comment
  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  /// The content of a comment
  @BuiltValueField(wireName: r'content')
  String get content;

  /// The author of a comment
  @BuiltValueField(wireName: r'author')
  UserResponseDTO? get author;

  /// The replies of a comment
  @BuiltValueField(wireName: r'replies')
  BuiltList<ReplyResponseDTO> get replies;

  /// Number of likes
  @BuiltValueField(wireName: r'likes')
  num get likes;

  CommentResponseDTO._();

  factory CommentResponseDTO([void updates(CommentResponseDTOBuilder b)]) = _$CommentResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CommentResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentResponseDTO> get serializer => _$CommentResponseDTOSerializer();
}

class _$CommentResponseDTOSerializer implements PrimitiveSerializer<CommentResponseDTO> {
  @override
  final Iterable<Type> types = const [CommentResponseDTO, _$CommentResponseDTO];

  @override
  final String wireName = r'CommentResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CommentResponseDTO object, {
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
    yield r'replies';
    yield serializers.serialize(
      object.replies,
      specifiedType: const FullType(BuiltList, [FullType(ReplyResponseDTO)]),
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
    CommentResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CommentResponseDTOBuilder result,
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
        case r'replies':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ReplyResponseDTO)]),
          ) as BuiltList<ReplyResponseDTO>;
          result.replies.replace(valueDes);
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
  CommentResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentResponseDTOBuilder();
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

