//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_comment_dto.g.dart';

/// UpdateCommentDTO
///
/// Properties:
/// * [commentId] - The unique id of the comment
/// * [content] - The content of the comment
@BuiltValue()
abstract class UpdateCommentDTO implements Built<UpdateCommentDTO, UpdateCommentDTOBuilder> {
  /// The unique id of the comment
  @BuiltValueField(wireName: r'commentId')
  num get commentId;

  /// The content of the comment
  @BuiltValueField(wireName: r'content')
  String get content;

  UpdateCommentDTO._();

  factory UpdateCommentDTO([void updates(UpdateCommentDTOBuilder b)]) = _$UpdateCommentDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCommentDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCommentDTO> get serializer => _$UpdateCommentDTOSerializer();
}

class _$UpdateCommentDTOSerializer implements PrimitiveSerializer<UpdateCommentDTO> {
  @override
  final Iterable<Type> types = const [UpdateCommentDTO, _$UpdateCommentDTO];

  @override
  final String wireName = r'UpdateCommentDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'commentId';
    yield serializers.serialize(
      object.commentId,
      specifiedType: const FullType(num),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateCommentDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'commentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.commentId = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateCommentDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCommentDTOBuilder();
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

