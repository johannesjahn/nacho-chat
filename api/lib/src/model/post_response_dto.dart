//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_response_dto.g.dart';

/// PostResponseDTO
///
/// Properties:
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [content] 
/// * [author] 
/// * [comments] 
abstract class PostResponseDTO implements Built<PostResponseDTO, PostResponseDTOBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'createdAt')
    DateTime get createdAt;

    @BuiltValueField(wireName: r'updatedAt')
    DateTime get updatedAt;

    @BuiltValueField(wireName: r'content')
    String get content;

    @BuiltValueField(wireName: r'author')
    UserResponseDTO get author;

    @BuiltValueField(wireName: r'comments')
    BuiltList<String> get comments;

    PostResponseDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(PostResponseDTOBuilder b) => b;

    factory PostResponseDTO([void updates(PostResponseDTOBuilder b)]) = _$PostResponseDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<PostResponseDTO> get serializer => _$PostResponseDTOSerializer();
}

class _$PostResponseDTOSerializer implements StructuredSerializer<PostResponseDTO> {
    @override
    final Iterable<Type> types = const [PostResponseDTO, _$PostResponseDTO];

    @override
    final String wireName = r'PostResponseDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, PostResponseDTO object,
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
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        result
            ..add(r'author')
            ..add(serializers.serialize(object.author,
                specifiedType: const FullType(UserResponseDTO)));
        result
            ..add(r'comments')
            ..add(serializers.serialize(object.comments,
                specifiedType: const FullType(BuiltList, [FullType(String)])));
        return result;
    }

    @override
    PostResponseDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = PostResponseDTOBuilder();

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
                case r'content':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.content = valueDes;
                    break;
                case r'author':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(UserResponseDTO)) as UserResponseDTO;
                    result.author.replace(valueDes);
                    break;
                case r'comments':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(String)])) as BuiltList<String>;
                    result.comments.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

