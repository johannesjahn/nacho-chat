//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_post_dto.g.dart';

/// UpdatePostDTO
///
/// Properties:
/// * [id] 
/// * [content] 
/// * [contentType] 
abstract class UpdatePostDTO implements Built<UpdatePostDTO, UpdatePostDTOBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    @BuiltValueField(wireName: r'content')
    String get content;

    @BuiltValueField(wireName: r'contentType')
    String get contentType;

    UpdatePostDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UpdatePostDTOBuilder b) => b;

    factory UpdatePostDTO([void updates(UpdatePostDTOBuilder b)]) = _$UpdatePostDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<UpdatePostDTO> get serializer => _$UpdatePostDTOSerializer();
}

class _$UpdatePostDTOSerializer implements StructuredSerializer<UpdatePostDTO> {
    @override
    final Iterable<Type> types = const [UpdatePostDTO, _$UpdatePostDTO];

    @override
    final String wireName = r'UpdatePostDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, UpdatePostDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(num)));
        result
            ..add(r'content')
            ..add(serializers.serialize(object.content,
                specifiedType: const FullType(String)));
        result
            ..add(r'contentType')
            ..add(serializers.serialize(object.contentType,
                specifiedType: const FullType(String)));
        return result;
    }

    @override
    UpdatePostDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UpdatePostDTOBuilder();

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
                case r'content':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.content = valueDes;
                    break;
                case r'contentType':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.contentType = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

