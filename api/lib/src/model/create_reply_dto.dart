//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_reply_dto.g.dart';

/// CreateReplyDTO
///
/// Properties:
/// * [commentId] 
/// * [content] 
abstract class CreateReplyDTO implements Built<CreateReplyDTO, CreateReplyDTOBuilder> {
    @BuiltValueField(wireName: r'commentId')
    num get commentId;

    @BuiltValueField(wireName: r'content')
    String get content;

    CreateReplyDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CreateReplyDTOBuilder b) => b;

    factory CreateReplyDTO([void updates(CreateReplyDTOBuilder b)]) = _$CreateReplyDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<CreateReplyDTO> get serializer => _$CreateReplyDTOSerializer();
}

class _$CreateReplyDTOSerializer implements StructuredSerializer<CreateReplyDTO> {
    @override
    final Iterable<Type> types = const [CreateReplyDTO, _$CreateReplyDTO];

    @override
    final String wireName = r'CreateReplyDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, CreateReplyDTO object,
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
    CreateReplyDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CreateReplyDTOBuilder();

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

