//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_comment_dto.g.dart';

/// UpdateCommentDTO
///
/// Properties:
/// * [commentId] 
/// * [content] 
abstract class UpdateCommentDTO implements Built<UpdateCommentDTO, UpdateCommentDTOBuilder> {
    @BuiltValueField(wireName: r'commentId')
    num get commentId;

    @BuiltValueField(wireName: r'content')
    String get content;

    UpdateCommentDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UpdateCommentDTOBuilder b) => b;

    factory UpdateCommentDTO([void updates(UpdateCommentDTOBuilder b)]) = _$UpdateCommentDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<UpdateCommentDTO> get serializer => _$UpdateCommentDTOSerializer();
}

class _$UpdateCommentDTOSerializer implements StructuredSerializer<UpdateCommentDTO> {
    @override
    final Iterable<Type> types = const [UpdateCommentDTO, _$UpdateCommentDTO];

    @override
    final String wireName = r'UpdateCommentDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, UpdateCommentDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'commentId')
            ..add(serializers.serialize(object.commentId,
                specifiedType: const FullType(num)));
        result
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    UpdateCommentDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UpdateCommentDTOBuilder();

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

