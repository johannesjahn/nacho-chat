//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mark_conversation_as_read_dto.g.dart';

/// MarkConversationAsReadDTO
///
/// Properties:
/// * [conversationId] - The id of the conversation to mark as read
@BuiltValue()
abstract class MarkConversationAsReadDTO implements Built<MarkConversationAsReadDTO, MarkConversationAsReadDTOBuilder> {
  /// The id of the conversation to mark as read
  @BuiltValueField(wireName: r'conversationId')
  num get conversationId;

  MarkConversationAsReadDTO._();

  factory MarkConversationAsReadDTO([void updates(MarkConversationAsReadDTOBuilder b)]) = _$MarkConversationAsReadDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MarkConversationAsReadDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MarkConversationAsReadDTO> get serializer => _$MarkConversationAsReadDTOSerializer();
}

class _$MarkConversationAsReadDTOSerializer implements PrimitiveSerializer<MarkConversationAsReadDTO> {
  @override
  final Iterable<Type> types = const [MarkConversationAsReadDTO, _$MarkConversationAsReadDTO];

  @override
  final String wireName = r'MarkConversationAsReadDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MarkConversationAsReadDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'conversationId';
    yield serializers.serialize(
      object.conversationId,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MarkConversationAsReadDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MarkConversationAsReadDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'conversationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.conversationId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MarkConversationAsReadDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MarkConversationAsReadDTOBuilder();
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

