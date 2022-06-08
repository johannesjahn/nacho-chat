//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_dto.g.dart';

/// LoginDTO
///
/// Properties:
/// * [username] 
/// * [password] 
abstract class LoginDTO implements Built<LoginDTO, LoginDTOBuilder> {
    @BuiltValueField(wireName: r'username')
    String get username;

    @BuiltValueField(wireName: r'password')
    String get password;

    LoginDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(LoginDTOBuilder b) => b;

    factory LoginDTO([void updates(LoginDTOBuilder b)]) = _$LoginDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<LoginDTO> get serializer => _$LoginDTOSerializer();
}

class _$LoginDTOSerializer implements StructuredSerializer<LoginDTO> {
    @override
    final Iterable<Type> types = const [LoginDTO, _$LoginDTO];

    @override
    final String wireName = r'LoginDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, LoginDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'username')
            ..add(serializers.serialize(object.username,
                specifiedType: const FullType(String)));
        result
            ..add(r'password')
            ..add(serializers.serialize(object.password,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    LoginDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = LoginDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'username':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.username = valueDes;
                    break;
                case r'password':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.password = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

