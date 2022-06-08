//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_dto.g.dart';

/// RegisterDTO
///
/// Properties:
/// * [username] 
/// * [password] 
abstract class RegisterDTO implements Built<RegisterDTO, RegisterDTOBuilder> {
    @BuiltValueField(wireName: r'username')
    String get username;

    @BuiltValueField(wireName: r'password')
    String get password;

    RegisterDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(RegisterDTOBuilder b) => b;

    factory RegisterDTO([void updates(RegisterDTOBuilder b)]) = _$RegisterDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<RegisterDTO> get serializer => _$RegisterDTOSerializer();
}

class _$RegisterDTOSerializer implements StructuredSerializer<RegisterDTO> {
    @override
    final Iterable<Type> types = const [RegisterDTO, _$RegisterDTO];

    @override
    final String wireName = r'RegisterDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, RegisterDTO object,
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
    RegisterDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = RegisterDTOBuilder();

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

