//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_messages_dto.g.dart';

/// GetMessagesDTO
///
/// Properties:
/// * [conversationId] 
/// * [lastMessage] - To reduce the amount of data fetched the client can send the id of the last received message and only get messages that are newer than that
abstract class GetMessagesDTO implements Built<GetMessagesDTO, GetMessagesDTOBuilder> {
    @BuiltValueField(wireName: r'conversationId')
    num get conversationId;

    /// To reduce the amount of data fetched the client can send the id of the last received message and only get messages that are newer than that
    @BuiltValueField(wireName: r'lastMessage')
    num? get lastMessage;

    GetMessagesDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(GetMessagesDTOBuilder b) => b;

    factory GetMessagesDTO([void updates(GetMessagesDTOBuilder b)]) = _$GetMessagesDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<GetMessagesDTO> get serializer => _$GetMessagesDTOSerializer();
}

class _$GetMessagesDTOSerializer implements StructuredSerializer<GetMessagesDTO> {
    @override
    final Iterable<Type> types = const [GetMessagesDTO, _$GetMessagesDTO];

    @override
    final String wireName = r'GetMessagesDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, GetMessagesDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'conversationId')
            ..add(serializers.serialize(object.conversationId,
                specifiedType: const FullType(num)));
        if (object.lastMessage != null) {
            result
                ..add(r'lastMessage')
                ..add(serializers.serialize(object.lastMessage,
                    specifiedType: const FullType(num)));
        }
        return result;
    }

    @override
    GetMessagesDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = GetMessagesDTOBuilder();

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
                case r'lastMessage':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.lastMessage = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

