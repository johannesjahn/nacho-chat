//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_message_dto.g.dart';

/// CreateMessageDTO
///
/// Properties:
/// * [conversationId] 
/// * [content] 
/// * [contentType] 
abstract class CreateMessageDTO implements Built<CreateMessageDTO, CreateMessageDTOBuilder> {
    @BuiltValueField(wireName: r'conversationId')
    num get conversationId;

    @BuiltValueField(wireName: r'content')
    String get content;

    @BuiltValueField(wireName: r'contentType')
    String get contentType;

    CreateMessageDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CreateMessageDTOBuilder b) => b;

    factory CreateMessageDTO([void updates(CreateMessageDTOBuilder b)]) = _$CreateMessageDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<CreateMessageDTO> get serializer => _$CreateMessageDTOSerializer();
}

class _$CreateMessageDTOSerializer implements StructuredSerializer<CreateMessageDTO> {
    @override
    final Iterable<Type> types = const [CreateMessageDTO, _$CreateMessageDTO];

    @override
    final String wireName = r'CreateMessageDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, CreateMessageDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'conversationId')
            ..add(serializers.serialize(object.conversationId,
                specifiedType: const FullType(num)));
        result
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        result
            ..add(r'contentType')
            ..add(serializers.serialize(object.contentType,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    CreateMessageDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CreateMessageDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'conversationId':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.conversationId = valueDes;
                    break;
                case r'content':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.content = valueDes;
                    break;
                case r'contentType':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.contentType = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

