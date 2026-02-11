//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'messages_count_response_dto.g.dart';

/// MessagesCountResponseDTO
///
/// Properties:
/// * [count] - The total number of messages sent by the authenticated user
@BuiltValue()
abstract class MessagesCountResponseDTO implements Built<MessagesCountResponseDTO, MessagesCountResponseDTOBuilder> {
  /// The total number of messages sent by the authenticated user
  @BuiltValueField(wireName: r'count')
  num get count;

  MessagesCountResponseDTO._();

  factory MessagesCountResponseDTO([void updates(MessagesCountResponseDTOBuilder b)]) = _$MessagesCountResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MessagesCountResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MessagesCountResponseDTO> get serializer => _$MessagesCountResponseDTOSerializer();
}

class _$MessagesCountResponseDTOSerializer implements PrimitiveSerializer<MessagesCountResponseDTO> {
  @override
  final Iterable<Type> types = const [MessagesCountResponseDTO, _$MessagesCountResponseDTO];

  @override
  final String wireName = r'MessagesCountResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MessagesCountResponseDTO object, {
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
    MessagesCountResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MessagesCountResponseDTOBuilder result,
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
  MessagesCountResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MessagesCountResponseDTOBuilder();
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

