//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/reply_response_dto_author.dart';
import 'package:openapi/src/model/reply_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_response_dto.g.dart';

/// CommentResponseDTO
///
/// Properties:
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [content] 
/// * [author] 
/// * [replies] 
abstract class CommentResponseDTO implements Built<CommentResponseDTO, CommentResponseDTOBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'createdAt')
    DateTime get createdAt;

    @BuiltValueField(wireName: r'updatedAt')
    DateTime get updatedAt;

    @BuiltValueField(wireName: r'content')
    String get content;

    @BuiltValueField(wireName: r'author')
    ReplyResponseDTOAuthor? get author;

    @BuiltValueField(wireName: r'replies')
    BuiltList<ReplyResponseDTO> get replies;

    CommentResponseDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CommentResponseDTOBuilder b) => b;

    factory CommentResponseDTO([void updates(CommentResponseDTOBuilder b)]) = _$CommentResponseDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<CommentResponseDTO> get serializer => _$CommentResponseDTOSerializer();
}

class _$CommentResponseDTOSerializer implements StructuredSerializer<CommentResponseDTO> {
    @override
    final Iterable<Type> types = const [CommentResponseDTO, _$CommentResponseDTO];

    @override
    final String wireName = r'CommentResponseDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, CommentResponseDTO object,
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
            ..add(object.author == null ? null : serializers.serialize(object.author,
                specifiedType: const FullType.nullable(ReplyResponseDTOAuthor)));
        result
            ..add(r'replies')
            ..add(serializers.serialize(object.replies,
                specifiedType: const FullType(BuiltList, [FullType(ReplyResponseDTO)])));
        return result;
    }

    @override
    CommentResponseDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CommentResponseDTOBuilder();

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
                        specifiedType: const FullType.nullable(ReplyResponseDTOAuthor)) as ReplyResponseDTOAuthor?;
                    if (valueDes == null) continue;
                    result.author.replace(valueDes);
                    break;
                case r'replies':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(ReplyResponseDTO)])) as BuiltList<ReplyResponseDTO>;
                    result.replies.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

