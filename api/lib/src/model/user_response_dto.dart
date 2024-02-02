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
/// * [id] - The unique id of a user
/// * [username] - The username of a user
/// * [avatarHash] - The avatar hash of a user
@BuiltValue(instantiable: false)
abstract class UserResponseDTO  {
  /// The unique id of a user
  @BuiltValueField(wireName: r'id')
  num get id;

  /// The username of a user
  @BuiltValueField(wireName: r'username')
  String get username;

  /// The avatar hash of a user
  @BuiltValueField(wireName: r'avatarHash')
  String? get avatarHash;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserResponseDTO> get serializer => _$UserResponseDTOSerializer();
}

class _$UserResponseDTOSerializer implements PrimitiveSerializer<UserResponseDTO> {
  @override
  final Iterable<Type> types = const [UserResponseDTO];

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
    yield r'avatarHash';
    yield object.avatarHash == null ? null : serializers.serialize(
      object.avatarHash,
      specifiedType: const FullType.nullable(String),
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

  @override
  UserResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($UserResponseDTO)) as $UserResponseDTO;
  }
}

/// a concrete implementation of [UserResponseDTO], since [UserResponseDTO] is not instantiable
@BuiltValue(instantiable: true)
abstract class $UserResponseDTO implements UserResponseDTO, Built<$UserResponseDTO, $UserResponseDTOBuilder> {
  $UserResponseDTO._();

  factory $UserResponseDTO([void Function($UserResponseDTOBuilder)? updates]) = _$$UserResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($UserResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$UserResponseDTO> get serializer => _$$UserResponseDTOSerializer();
}

class _$$UserResponseDTOSerializer implements PrimitiveSerializer<$UserResponseDTO> {
  @override
  final Iterable<Type> types = const [$UserResponseDTO, _$$UserResponseDTO];

  @override
  final String wireName = r'$UserResponseDTO';

  @override
  Object serialize(
    Serializers serializers,
    $UserResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(UserResponseDTO))!;
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
        case r'avatarHash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatarHash = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $UserResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $UserResponseDTOBuilder();
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

