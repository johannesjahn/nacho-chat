//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_comments_dto.g.dart';

/// GetCommentsDTO
///
/// Properties:
/// * [postId] 
abstract class GetCommentsDTO implements Built<GetCommentsDTO, GetCommentsDTOBuilder> {
    @BuiltValueField(wireName: r'postId')
    num get postId;

    GetCommentsDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(GetCommentsDTOBuilder b) => b;

    factory GetCommentsDTO([void updates(GetCommentsDTOBuilder b)]) = _$GetCommentsDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<GetCommentsDTO> get serializer => _$GetCommentsDTOSerializer();
}

class _$GetCommentsDTOSerializer implements StructuredSerializer<GetCommentsDTO> {
    @override
    final Iterable<Type> types = const [GetCommentsDTO, _$GetCommentsDTO];

    @override
    final String wireName = r'GetCommentsDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, GetCommentsDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'postId')
            ..add(serializers.serialize(object.postId,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    GetCommentsDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = GetCommentsDTOBuilder();

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
            }
        }
        return result.build();
    }
}

