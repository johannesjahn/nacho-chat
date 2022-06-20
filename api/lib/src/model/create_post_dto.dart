//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_post_dto.g.dart';

/// CreatePostDTO
///
/// Properties:
/// * [content] - The content of a post
abstract class CreatePostDTO implements Built<CreatePostDTO, CreatePostDTOBuilder> {
    /// The content of a post
    @BuiltValueField(wireName: r'content')
    String get content;

    CreatePostDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CreatePostDTOBuilder b) => b;

    factory CreatePostDTO([void updates(CreatePostDTOBuilder b)]) = _$CreatePostDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<CreatePostDTO> get serializer => _$CreatePostDTOSerializer();
}

class _$CreatePostDTOSerializer implements StructuredSerializer<CreatePostDTO> {
    @override
    final Iterable<Type> types = const [CreatePostDTO, _$CreatePostDTO];

    @override
    final String wireName = r'CreatePostDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, CreatePostDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    CreatePostDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CreatePostDTOBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
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

