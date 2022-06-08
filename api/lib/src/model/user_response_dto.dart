//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_response_dto.g.dart';

/// UserResponseDTO
///
/// Properties:
/// * [id] 
/// * [username] 
abstract class UserResponseDTO implements Built<UserResponseDTO, UserResponseDTOBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'username')
    String get username;

    UserResponseDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UserResponseDTOBuilder b) => b;

    factory UserResponseDTO([void updates(UserResponseDTOBuilder b)]) = _$UserResponseDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<UserResponseDTO> get serializer => _$UserResponseDTOSerializer();
}

class _$UserResponseDTOSerializer implements StructuredSerializer<UserResponseDTO> {
    @override
    final Iterable<Type> types = const [UserResponseDTO, _$UserResponseDTO];

    @override
    final String wireName = r'UserResponseDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, UserResponseDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(num)));
        result
            ..add(r'username')
            ..add(serializers.serialize(object.username,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    UserResponseDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UserResponseDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'id':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.id = valueDes;
                    break;
                case r'username':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.username = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

