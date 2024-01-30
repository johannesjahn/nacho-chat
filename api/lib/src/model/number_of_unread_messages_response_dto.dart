//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'number_of_unread_messages_response_dto.g.dart';

/// NumberOfUnreadMessagesResponseDTO
///
/// Properties:
/// * [count] - The number of unread messages for the authenticated user
@BuiltValue()
abstract class NumberOfUnreadMessagesResponseDTO implements Built<NumberOfUnreadMessagesResponseDTO, NumberOfUnreadMessagesResponseDTOBuilder> {
  /// The number of unread messages for the authenticated user
  @BuiltValueField(wireName: r'count')
  num get count;

  NumberOfUnreadMessagesResponseDTO._();

  factory NumberOfUnreadMessagesResponseDTO([void updates(NumberOfUnreadMessagesResponseDTOBuilder b)]) = _$NumberOfUnreadMessagesResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NumberOfUnreadMessagesResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NumberOfUnreadMessagesResponseDTO> get serializer => _$NumberOfUnreadMessagesResponseDTOSerializer();
}

class _$NumberOfUnreadMessagesResponseDTOSerializer implements PrimitiveSerializer<NumberOfUnreadMessagesResponseDTO> {
  @override
  final Iterable<Type> types = const [NumberOfUnreadMessagesResponseDTO, _$NumberOfUnreadMessagesResponseDTO];

  @override
  final String wireName = r'NumberOfUnreadMessagesResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NumberOfUnreadMessagesResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'count';
    yield serializers.serialize(
      object.count,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NumberOfUnreadMessagesResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NumberOfUnreadMessagesResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.count = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NumberOfUnreadMessagesResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NumberOfUnreadMessagesResponseDTOBuilder();
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

