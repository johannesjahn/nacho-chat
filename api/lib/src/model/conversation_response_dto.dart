//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:openapi/src/model/message_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'conversation_response_dto.g.dart';

/// ConversationResponseDTO
///
/// Properties:
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [participants] 
/// * [messages] 
abstract class ConversationResponseDTO implements Built<ConversationResponseDTO, ConversationResponseDTOBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'createdAt')
    DateTime get createdAt;

    @BuiltValueField(wireName: r'updatedAt')
    DateTime get updatedAt;

    @BuiltValueField(wireName: r'participants')
    BuiltList<UserResponseDTO> get participants;

    @BuiltValueField(wireName: r'messages')
    BuiltList<MessageResponseDTO> get messages;

    ConversationResponseDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(ConversationResponseDTOBuilder b) => b;

    factory ConversationResponseDTO([void updates(ConversationResponseDTOBuilder b)]) = _$ConversationResponseDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<ConversationResponseDTO> get serializer => _$ConversationResponseDTOSerializer();
}

class _$ConversationResponseDTOSerializer implements StructuredSerializer<ConversationResponseDTO> {
    @override
    final Iterable<Type> types = const [ConversationResponseDTO, _$ConversationResponseDTO];

    @override
    final String wireName = r'ConversationResponseDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, ConversationResponseDTO object,
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
            ..add(r'participants')
            ..add(serializers.serialize(object.participants,
                specifiedType: const FullType(BuiltList, [FullType(UserResponseDTO)])));
        result
            ..add(r'messages')
            ..add(serializers.serialize(object.messages,
                specifiedType: const FullType(BuiltList, [FullType(MessageResponseDTO)])));
        return result;
    }

    @override
    ConversationResponseDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = ConversationResponseDTOBuilder();

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
                case r'participants':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(UserResponseDTO)])) as BuiltList<UserResponseDTO>;
                    result.participants.replace(valueDes);
                    break;
                case r'messages':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(MessageResponseDTO)])) as BuiltList<MessageResponseDTO>;
                    result.messages.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

