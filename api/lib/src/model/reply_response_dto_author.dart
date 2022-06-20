//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/user_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reply_response_dto_author.g.dart';

/// ReplyResponseDTOAuthor
///
/// Properties:
/// * [id] 
/// * [username] 
abstract class ReplyResponseDTOAuthor implements Built<ReplyResponseDTOAuthor, ReplyResponseDTOAuthorBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'username')
    String get username;

    ReplyResponseDTOAuthor._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(ReplyResponseDTOAuthorBuilder b) => b;

    factory ReplyResponseDTOAuthor([void updates(ReplyResponseDTOAuthorBuilder b)]) = _$ReplyResponseDTOAuthor;

    @BuiltValueSerializer(custom: true)
    static Serializer<ReplyResponseDTOAuthor> get serializer => _$ReplyResponseDTOAuthorSerializer();
}

class _$ReplyResponseDTOAuthorSerializer implements StructuredSerializer<ReplyResponseDTOAuthor> {
    @override
    final Iterable<Type> types = const [ReplyResponseDTOAuthor, _$ReplyResponseDTOAuthor];

    @override
    final String wireName = r'ReplyResponseDTOAuthor';

    @override
    Iterable<Object?> serialize(Serializers serializers, ReplyResponseDTOAuthor object,
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
    ReplyResponseDTOAuthor deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = ReplyResponseDTOAuthorBuilder();

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

