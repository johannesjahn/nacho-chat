//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_reply_dto.g.dart';

/// DeleteReplyDTO
///
/// Properties:
/// * [replyId] 
@BuiltValue()
abstract class DeleteReplyDTO implements Built<DeleteReplyDTO, DeleteReplyDTOBuilder> {
  @BuiltValueField(wireName: r'replyId')
  num get replyId;

  DeleteReplyDTO._();

  factory DeleteReplyDTO([void updates(DeleteReplyDTOBuilder b)]) = _$DeleteReplyDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteReplyDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteReplyDTO> get serializer => _$DeleteReplyDTOSerializer();
}

class _$DeleteReplyDTOSerializer implements PrimitiveSerializer<DeleteReplyDTO> {
  @override
  final Iterable<Type> types = const [DeleteReplyDTO, _$DeleteReplyDTO];

  @override
  final String wireName = r'DeleteReplyDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteReplyDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'replyId';
    yield serializers.serialize(
      object.replyId,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteReplyDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteReplyDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'replyId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.replyId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteReplyDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteReplyDTOBuilder();
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

