//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_reply_dto.g.dart';

/// DeleteReplyDTO
///
/// Properties:
/// * [replyId] 
abstract class DeleteReplyDTO implements Built<DeleteReplyDTO, DeleteReplyDTOBuilder> {
    @BuiltValueField(wireName: r'replyId')
    num get replyId;

    DeleteReplyDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(DeleteReplyDTOBuilder b) => b;

    factory DeleteReplyDTO([void updates(DeleteReplyDTOBuilder b)]) = _$DeleteReplyDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<DeleteReplyDTO> get serializer => _$DeleteReplyDTOSerializer();
}

class _$DeleteReplyDTOSerializer implements StructuredSerializer<DeleteReplyDTO> {
    @override
    final Iterable<Type> types = const [DeleteReplyDTO, _$DeleteReplyDTO];

    @override
    final String wireName = r'DeleteReplyDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, DeleteReplyDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'replyId')
            ..add(serializers.serialize(object.replyId,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    DeleteReplyDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = DeleteReplyDTOBuilder();

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
            }
        }
        return result.build();
    }
}

