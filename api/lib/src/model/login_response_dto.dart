//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_response_dto.g.dart';

/// LoginResponseDTO
///
/// Properties:
/// * [accessToken] 
@BuiltValue()
abstract class LoginResponseDTO implements Built<LoginResponseDTO, LoginResponseDTOBuilder> {
  @BuiltValueField(wireName: r'access_token')
  String get accessToken;

  LoginResponseDTO._();

  factory LoginResponseDTO([void updates(LoginResponseDTOBuilder b)]) = _$LoginResponseDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginResponseDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginResponseDTO> get serializer => _$LoginResponseDTOSerializer();
}

class _$LoginResponseDTOSerializer implements PrimitiveSerializer<LoginResponseDTO> {
  @override
  final Iterable<Type> types = const [LoginResponseDTO, _$LoginResponseDTO];

  @override
  final String wireName = r'LoginResponseDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'access_token';
    yield serializers.serialize(
      object.accessToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginResponseDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginResponseDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'access_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginResponseDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginResponseDTOBuilder();
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

