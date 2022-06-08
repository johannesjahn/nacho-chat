//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_comment_dto.g.dart';

/// CreateCommentDTO
///
/// Properties:
/// * [postId] 
/// * [content] 
abstract class CreateCommentDTO implements Built<CreateCommentDTO, CreateCommentDTOBuilder> {
    @BuiltValueField(wireName: r'postId')
    num get postId;

    @BuiltValueField(wireName: r'content')
    String get content;

    CreateCommentDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CreateCommentDTOBuilder b) => b;

    factory CreateCommentDTO([void updates(CreateCommentDTOBuilder b)]) = _$CreateCommentDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<CreateCommentDTO> get serializer => _$CreateCommentDTOSerializer();
}

class _$CreateCommentDTOSerializer implements StructuredSerializer<CreateCommentDTO> {
    @override
    final Iterable<Type> types = const [CreateCommentDTO, _$CreateCommentDTO];

    @override
    final String wireName = r'CreateCommentDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, CreateCommentDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'postId')
            ..add(serializers.serialize(object.postId,
                specifiedType: const FullType(num)));
        result
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    CreateCommentDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CreateCommentDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'postId':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.postId = valueDes;
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

