//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'has_unread_messages_response_dto.g.dart';

/// HasUnreadMessagesResponseDTO
///
/// Properties:
/// * [hasUnreadMessages] - Whether the authenticated user has unread messages
@BuiltValue()
abstract class HasUnreadMessagesResponseDTO implements Built<HasUnreadMessagesResponseDTO, HasUnreadMessagesResponseDTOBuilder> {
  /// Whether the authenticated user has unread messages
  @BuiltValueField(wireName: r'hasUnreadMessages')
  bool get hasUnreadMessages;

  HasUnreadMessagesResponseDTO._();

  factory HasUnreadMessagesResponseDTO([void updates(HasUnreadMessagesResponseDTOBuilder b)]) = _$HasUnreadMessagesResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HasUnreadMessagesResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HasUnreadMessagesResponseDTO> get serializer => _$HasUnreadMessagesResponseDTOSerializer();
}

class _$HasUnreadMessagesResponseDTOSerializer implements PrimitiveSerializer<HasUnreadMessagesResponseDTO> {
  @override
  final Iterable<Type> types = const [HasUnreadMessagesResponseDTO, _$HasUnreadMessagesResponseDTO];

  @override
  final String wireName = r'HasUnreadMessagesResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HasUnreadMessagesResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'hasUnreadMessages';
    yield serializers.serialize(
      object.hasUnreadMessages,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HasUnreadMessagesResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HasUnreadMessagesResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hasUnreadMessages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasUnreadMessages = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HasUnreadMessagesResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HasUnreadMessagesResponseDTOBuilder();
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

