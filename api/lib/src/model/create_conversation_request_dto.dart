//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_conversation_request_dto.g.dart';

/// CreateConversationRequestDTO
///
/// Properties:
/// * [partnerIds] - The partner ids of a conversation (Can't be empty or contain self)
@BuiltValue()
abstract class CreateConversationRequestDTO implements Built<CreateConversationRequestDTO, CreateConversationRequestDTOBuilder> {
  /// The partner ids of a conversation (Can't be empty or contain self)
  @BuiltValueField(wireName: r'partnerIds')
  BuiltList<num> get partnerIds;

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
    yield r'partnerIds';
    yield serializers.serialize(
      object.partnerIds,
      specifiedType: const FullType(BuiltList, [FullType(num)]),
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
        case r'partnerIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(num)]),
          ) as BuiltList<num>;
          result.partnerIds.replace(valueDes);
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

