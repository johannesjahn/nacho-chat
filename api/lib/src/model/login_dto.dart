//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_dto.g.dart';

/// LoginDTO
///
/// Properties:
/// * [username] 
/// * [password] 
@BuiltValue()
abstract class LoginDTO implements Built<LoginDTO, LoginDTOBuilder> {
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'password')
  String get password;

  LoginDTO._();

  factory LoginDTO([void updates(LoginDTOBuilder b)]) = _$LoginDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginDTO> get serializer => _$LoginDTOSerializer();
}

class _$LoginDTOSerializer implements PrimitiveSerializer<LoginDTO> {
  @override
  final Iterable<Type> types = const [LoginDTO, _$LoginDTO];

  @override
  final String wireName = r'LoginDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginDTOBuilder();
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

