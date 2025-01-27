//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'debug_response_dto.g.dart';

/// DebugResponseDTO
///
/// Properties:
/// * [message] - The message
@BuiltValue()
abstract class DebugResponseDTO implements Built<DebugResponseDTO, DebugResponseDTOBuilder> {
  /// The message
  @BuiltValueField(wireName: r'message')
  String get message;

  DebugResponseDTO._();

  factory DebugResponseDTO([void updates(DebugResponseDTOBuilder b)]) = _$DebugResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DebugResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DebugResponseDTO> get serializer => _$DebugResponseDTOSerializer();
}

class _$DebugResponseDTOSerializer implements PrimitiveSerializer<DebugResponseDTO> {
  @override
  final Iterable<Type> types = const [DebugResponseDTO, _$DebugResponseDTO];

  @override
  final String wireName = r'DebugResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DebugResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DebugResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DebugResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DebugResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DebugResponseDTOBuilder();
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

