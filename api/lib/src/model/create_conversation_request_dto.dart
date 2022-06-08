//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_conversation_request_dto.g.dart';

/// CreateConversationRequestDTO
///
/// Properties:
/// * [partnerId] 
abstract class CreateConversationRequestDTO implements Built<CreateConversationRequestDTO, CreateConversationRequestDTOBuilder> {
    @BuiltValueField(wireName: r'partnerId')
    num get partnerId;

    CreateConversationRequestDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CreateConversationRequestDTOBuilder b) => b;

    factory CreateConversationRequestDTO([void updates(CreateConversationRequestDTOBuilder b)]) = _$CreateConversationRequestDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<CreateConversationRequestDTO> get serializer => _$CreateConversationRequestDTOSerializer();
}

class _$CreateConversationRequestDTOSerializer implements StructuredSerializer<CreateConversationRequestDTO> {
    @override
    final Iterable<Type> types = const [CreateConversationRequestDTO, _$CreateConversationRequestDTO];

    @override
    final String wireName = r'CreateConversationRequestDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, CreateConversationRequestDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'partnerId')
            ..add(serializers.serialize(object.partnerId,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    CreateConversationRequestDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CreateConversationRequestDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'partnerId':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.partnerId = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

