//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_comment_dto.g.dart';

/// DeleteCommentDTO
///
/// Properties:
/// * [commentId] 
abstract class DeleteCommentDTO implements Built<DeleteCommentDTO, DeleteCommentDTOBuilder> {
    @BuiltValueField(wireName: r'commentId')
    num get commentId;

    DeleteCommentDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(DeleteCommentDTOBuilder b) => b;

    factory DeleteCommentDTO([void updates(DeleteCommentDTOBuilder b)]) = _$DeleteCommentDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<DeleteCommentDTO> get serializer => _$DeleteCommentDTOSerializer();
}

class _$DeleteCommentDTOSerializer implements StructuredSerializer<DeleteCommentDTO> {
    @override
    final Iterable<Type> types = const [DeleteCommentDTO, _$DeleteCommentDTO];

    @override
    final String wireName = r'DeleteCommentDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, DeleteCommentDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'commentId')
            ..add(serializers.serialize(object.commentId,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    DeleteCommentDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = DeleteCommentDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'commentId':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.commentId = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

