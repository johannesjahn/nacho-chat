//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_password_dto.g.dart';

/// ChangePasswordDTO
///
/// Properties:
/// * [password] - The new password
/// * [passwordConfirm] - The new password again, to confirm it got typed in properly
@BuiltValue()
abstract class ChangePasswordDTO implements Built<ChangePasswordDTO, ChangePasswordDTOBuilder> {
  /// The new password
  @BuiltValueField(wireName: r'password')
  String get password;

  /// The new password again, to confirm it got typed in properly
  @BuiltValueField(wireName: r'passwordConfirm')
  String get passwordConfirm;

  ChangePasswordDTO._();

  factory ChangePasswordDTO([void updates(ChangePasswordDTOBuilder b)]) = _$ChangePasswordDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangePasswordDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangePasswordDTO> get serializer => _$ChangePasswordDTOSerializer();
}

class _$ChangePasswordDTOSerializer implements PrimitiveSerializer<ChangePasswordDTO> {
  @override
  final Iterable<Type> types = const [ChangePasswordDTO, _$ChangePasswordDTO];

  @override
  final String wireName = r'ChangePasswordDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangePasswordDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
    yield r'passwordConfirm';
    yield serializers.serialize(
      object.passwordConfirm,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChangePasswordDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChangePasswordDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        case r'passwordConfirm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.passwordConfirm = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChangePasswordDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangePasswordDTOBuilder();
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

