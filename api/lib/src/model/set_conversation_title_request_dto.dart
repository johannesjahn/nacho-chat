//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_conversation_title_request_dto.g.dart';

/// SetConversationTitleRequestDTO
///
/// Properties:
/// * [conversationId] - The id of the conversation
/// * [title] - The title to set for the conversation
@BuiltValue()
abstract class SetConversationTitleRequestDTO implements Built<SetConversationTitleRequestDTO, SetConversationTitleRequestDTOBuilder> {
  /// The id of the conversation
  @BuiltValueField(wireName: r'conversationId')
  num get conversationId;

  /// The title to set for the conversation
  @BuiltValueField(wireName: r'title')
  String get title;

  SetConversationTitleRequestDTO._();

  factory SetConversationTitleRequestDTO([void updates(SetConversationTitleRequestDTOBuilder b)]) = _$SetConversationTitleRequestDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetConversationTitleRequestDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetConversationTitleRequestDTO> get serializer => _$SetConversationTitleRequestDTOSerializer();
}

class _$SetConversationTitleRequestDTOSerializer implements PrimitiveSerializer<SetConversationTitleRequestDTO> {
  @override
  final Iterable<Type> types = const [SetConversationTitleRequestDTO, _$SetConversationTitleRequestDTO];

  @override
  final String wireName = r'SetConversationTitleRequestDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetConversationTitleRequestDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'conversationId';
    yield serializers.serialize(
      object.conversationId,
      specifiedType: const FullType(num),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SetConversationTitleRequestDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetConversationTitleRequestDTOBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SetConversationTitleRequestDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetConversationTitleRequestDTOBuilder();
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

