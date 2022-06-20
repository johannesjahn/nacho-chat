//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_response_dto_author.g.dart';

/// PostResponseDTOAuthor
///
/// Properties:
/// * [id] 
/// * [username] 
abstract class PostResponseDTOAuthor implements Built<PostResponseDTOAuthor, PostResponseDTOAuthorBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'username')
    String get username;

    PostResponseDTOAuthor._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(PostResponseDTOAuthorBuilder b) => b;

    factory PostResponseDTOAuthor([void updates(PostResponseDTOAuthorBuilder b)]) = _$PostResponseDTOAuthor;

    @BuiltValueSerializer(custom: true)
    static Serializer<PostResponseDTOAuthor> get serializer => _$PostResponseDTOAuthorSerializer();
}

class _$PostResponseDTOAuthorSerializer implements StructuredSerializer<PostResponseDTOAuthor> {
    @override
    final Iterable<Type> types = const [PostResponseDTOAuthor, _$PostResponseDTOAuthor];

    @override
    final String wireName = r'PostResponseDTOAuthor';

    @override
    Iterable<Object?> serialize(Serializers serializers, PostResponseDTOAuthor object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(num)));
        result
            ..add(r'username')
            ..add(serializers.serialize(object.username,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    PostResponseDTOAuthor deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = PostResponseDTOAuthorBuilder();

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
                case r'username':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.username = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

