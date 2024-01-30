//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mark_message_as_read_dto.g.dart';

/// MarkMessageAsReadDTO
///
/// Properties:
/// * [messageId] - The id of the message to mark as read
@BuiltValue()
abstract class MarkMessageAsReadDTO implements Built<MarkMessageAsReadDTO, MarkMessageAsReadDTOBuilder> {
  /// The id of the message to mark as read
  @BuiltValueField(wireName: r'messageId')
  num get messageId;

  MarkMessageAsReadDTO._();

  factory MarkMessageAsReadDTO([void updates(MarkMessageAsReadDTOBuilder b)]) = _$MarkMessageAsReadDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MarkMessageAsReadDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MarkMessageAsReadDTO> get serializer => _$MarkMessageAsReadDTOSerializer();
}

class _$MarkMessageAsReadDTOSerializer implements PrimitiveSerializer<MarkMessageAsReadDTO> {
  @override
  final Iterable<Type> types = const [MarkMessageAsReadDTO, _$MarkMessageAsReadDTO];

  @override
  final String wireName = r'MarkMessageAsReadDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MarkMessageAsReadDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'messageId';
    yield serializers.serialize(
      object.messageId,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MarkMessageAsReadDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MarkMessageAsReadDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'messageId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.messageId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MarkMessageAsReadDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MarkMessageAsReadDTOBuilder();
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

