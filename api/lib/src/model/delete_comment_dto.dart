//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_comment_dto.g.dart';

/// DeleteCommentDTO
///
/// Properties:
/// * [commentId] 
@BuiltValue()
abstract class DeleteCommentDTO implements Built<DeleteCommentDTO, DeleteCommentDTOBuilder> {
  @BuiltValueField(wireName: r'commentId')
  num get commentId;

  DeleteCommentDTO._();

  factory DeleteCommentDTO([void updates(DeleteCommentDTOBuilder b)]) = _$DeleteCommentDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteCommentDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteCommentDTO> get serializer => _$DeleteCommentDTOSerializer();
}

class _$DeleteCommentDTOSerializer implements PrimitiveSerializer<DeleteCommentDTO> {
  @override
  final Iterable<Type> types = const [DeleteCommentDTO, _$DeleteCommentDTO];

  @override
  final String wireName = r'DeleteCommentDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'commentId';
    yield serializers.serialize(
      object.commentId,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteCommentDTOBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteCommentDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteCommentDTOBuilder();
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

