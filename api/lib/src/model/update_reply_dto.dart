//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_reply_dto.g.dart';

/// UpdateReplyDTO
///
/// Properties:
/// * [replyId] 
/// * [content] 
abstract class UpdateReplyDTO implements Built<UpdateReplyDTO, UpdateReplyDTOBuilder> {
    @BuiltValueField(wireName: r'replyId')
    num get replyId;

    @BuiltValueField(wireName: r'content')
    String get content;

    UpdateReplyDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UpdateReplyDTOBuilder b) => b;

    factory UpdateReplyDTO([void updates(UpdateReplyDTOBuilder b)]) = _$UpdateReplyDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<UpdateReplyDTO> get serializer => _$UpdateReplyDTOSerializer();
}

class _$UpdateReplyDTOSerializer implements StructuredSerializer<UpdateReplyDTO> {
    @override
    final Iterable<Type> types = const [UpdateReplyDTO, _$UpdateReplyDTO];

    @override
    final String wireName = r'UpdateReplyDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, UpdateReplyDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'replyId')
            ..add(serializers.serialize(object.replyId,
                specifiedType: const FullType(num)));
        result
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    UpdateReplyDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UpdateReplyDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'replyId':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.replyId = valueDes;
                    break;
                case r'content':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.content = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

