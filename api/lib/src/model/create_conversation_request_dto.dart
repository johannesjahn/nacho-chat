//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_conversation_request_dto.g.dart';

/// CreateConversationRequestDTO
///
/// Properties:
/// * [partnerId] 
@BuiltValue()
abstract class CreateConversationRequestDTO implements Built<CreateConversationRequestDTO, CreateConversationRequestDTOBuilder> {
  @BuiltValueField(wireName: r'partnerId')
  num get partnerId;

  CreateConversationRequestDTO._();

  factory CreateConversationRequestDTO([void updates(CreateConversationRequestDTOBuilder b)]) = _$CreateConversationRequestDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateConversationRequestDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateConversationRequestDTO> get serializer => _$CreateConversationRequestDTOSerializer();
}

class _$CreateConversationRequestDTOSerializer implements PrimitiveSerializer<CreateConversationRequestDTO> {
  @override
  final Iterable<Type> types = const [CreateConversationRequestDTO, _$CreateConversationRequestDTO];

  @override
  final String wireName = r'CreateConversationRequestDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateConversationRequestDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'partnerId';
    yield serializers.serialize(
      object.partnerId,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateConversationRequestDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateConversationRequestDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'partnerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.partnerId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateConversationRequestDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateConversationRequestDTOBuilder();
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

