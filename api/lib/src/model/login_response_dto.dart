//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_response_dto.g.dart';

/// LoginResponseDTO
///
/// Properties:
/// * [accessToken] 
abstract class LoginResponseDTO implements Built<LoginResponseDTO, LoginResponseDTOBuilder> {
    @BuiltValueField(wireName: r'access_token')
    String get accessToken;

    LoginResponseDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(LoginResponseDTOBuilder b) => b;

    factory LoginResponseDTO([void updates(LoginResponseDTOBuilder b)]) = _$LoginResponseDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<LoginResponseDTO> get serializer => _$LoginResponseDTOSerializer();
}

class _$LoginResponseDTOSerializer implements StructuredSerializer<LoginResponseDTO> {
    @override
    final Iterable<Type> types = const [LoginResponseDTO, _$LoginResponseDTO];

    @override
    final String wireName = r'LoginResponseDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, LoginResponseDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'access_token')
            ..add(serializers.serialize(object.accessToken,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    LoginResponseDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = LoginResponseDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'access_token':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.accessToken = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

