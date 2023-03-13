//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_response_dto.g.dart';

/// UserResponseDTO
///
/// Properties:
/// * [id] 
/// * [username] 
@BuiltValue()
abstract class UserResponseDTO implements Built<UserResponseDTO, UserResponseDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  num get id;

  @BuiltValueField(wireName: r'username')
  String get username;

  UserResponseDTO._();

  factory UserResponseDTO([void updates(UserResponseDTOBuilder b)]) = _$UserResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserResponseDTO> get serializer => _$UserResponseDTOSerializer();
}

class _$UserResponseDTOSerializer implements PrimitiveSerializer<UserResponseDTO> {
  @override
  final Iterable<Type> types = const [UserResponseDTO, _$UserResponseDTO];

  @override
  final String wireName = r'UserResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.id = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserResponseDTOBuilder();
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

