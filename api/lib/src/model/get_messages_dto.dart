//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_messages_dto.g.dart';

/// GetMessagesDTO
///
/// Properties:
/// * [conversationId] - The id of the conversation to get messages from
/// * [lastMessage] - To reduce the amount of data fetched the client can send the id of the last received message and only get messages that are newer than that
@BuiltValue()
abstract class GetMessagesDTO implements Built<GetMessagesDTO, GetMessagesDTOBuilder> {
  /// The id of the conversation to get messages from
  @BuiltValueField(wireName: r'conversationId')
  num get conversationId;

  /// To reduce the amount of data fetched the client can send the id of the last received message and only get messages that are newer than that
  @BuiltValueField(wireName: r'lastMessage')
  num? get lastMessage;

  GetMessagesDTO._();

  factory GetMessagesDTO([void updates(GetMessagesDTOBuilder b)]) = _$GetMessagesDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetMessagesDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetMessagesDTO> get serializer => _$GetMessagesDTOSerializer();
}

class _$GetMessagesDTOSerializer implements PrimitiveSerializer<GetMessagesDTO> {
  @override
  final Iterable<Type> types = const [GetMessagesDTO, _$GetMessagesDTO];

  @override
  final String wireName = r'GetMessagesDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetMessagesDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'conversationId';
    yield serializers.serialize(
      object.conversationId,
      specifiedType: const FullType(num),
    );
    if (object.lastMessage != null) {
      yield r'lastMessage';
      yield serializers.serialize(
        object.lastMessage,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetMessagesDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetMessagesDTOBuilder result,
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
        case r'lastMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.lastMessage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetMessagesDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetMessagesDTOBuilder();
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

