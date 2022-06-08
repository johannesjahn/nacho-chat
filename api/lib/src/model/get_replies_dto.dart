//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_replies_dto.g.dart';

/// GetRepliesDTO
///
/// Properties:
/// * [commentId] 
abstract class GetRepliesDTO implements Built<GetRepliesDTO, GetRepliesDTOBuilder> {
    @BuiltValueField(wireName: r'commentId')
    num get commentId;

    GetRepliesDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(GetRepliesDTOBuilder b) => b;

    factory GetRepliesDTO([void updates(GetRepliesDTOBuilder b)]) = _$GetRepliesDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<GetRepliesDTO> get serializer => _$GetRepliesDTOSerializer();
}

class _$GetRepliesDTOSerializer implements StructuredSerializer<GetRepliesDTO> {
    @override
    final Iterable<Type> types = const [GetRepliesDTO, _$GetRepliesDTO];

    @override
    final String wireName = r'GetRepliesDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, GetRepliesDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'commentId')
            ..add(serializers.serialize(object.commentId,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    GetRepliesDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = GetRepliesDTOBuilder();

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

