//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_response_dto.g.dart';

/// MessageResponseDTO
///
/// Properties:
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [content] 
/// * [author] 
abstract class MessageResponseDTO implements Built<MessageResponseDTO, MessageResponseDTOBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'createdAt')
    DateTime get createdAt;

    @BuiltValueField(wireName: r'updatedAt')
    DateTime get updatedAt;

    @BuiltValueField(wireName: r'content')
    String get content;

    @BuiltValueField(wireName: r'author')
    UserResponseDTO get author;

    MessageResponseDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(MessageResponseDTOBuilder b) => b;

    factory MessageResponseDTO([void updates(MessageResponseDTOBuilder b)]) = _$MessageResponseDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<MessageResponseDTO> get serializer => _$MessageResponseDTOSerializer();
}

class _$MessageResponseDTOSerializer implements StructuredSerializer<MessageResponseDTO> {
    @override
    final Iterable<Type> types = const [MessageResponseDTO, _$MessageResponseDTO];

    @override
    final String wireName = r'MessageResponseDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, MessageResponseDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(num)));
        result
            ..add(r'createdAt')
            ..add(serializers.serialize(object.createdAt,
                specifiedType: const FullType(DateTime)));
        result
            ..add(r'updatedAt')
            ..add(serializers.serialize(object.updatedAt,
                specifiedType: const FullType(DateTime)));
        result
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        result
            ..add(r'author')
            ..add(serializers.serialize(object.author,
                specifiedType: const FullType(UserResponseDTO)));
        return result;
    }

    @override
    MessageResponseDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = MessageResponseDTOBuilder();

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
                case r'createdAt':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    result.createdAt = valueDes;
                    break;
                case r'updatedAt':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(DateTime)) as DateTime;
                    result.updatedAt = valueDes;
                    break;
                case r'content':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.content = valueDes;
                    break;
                case r'author':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(UserResponseDTO)) as UserResponseDTO;
                    result.author.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

