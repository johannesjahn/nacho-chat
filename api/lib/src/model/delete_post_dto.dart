//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_post_dto.g.dart';

/// DeletePostDTO
///
/// Properties:
/// * [id] 
abstract class DeletePostDTO implements Built<DeletePostDTO, DeletePostDTOBuilder> {
    @BuiltValueField(wireName: r'id')
    num get id;

    DeletePostDTO._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(DeletePostDTOBuilder b) => b;

    factory DeletePostDTO([void updates(DeletePostDTOBuilder b)]) = _$DeletePostDTO;

    @BuiltValueSerializer(custom: true)
    static Serializer<DeletePostDTO> get serializer => _$DeletePostDTOSerializer();
}

class _$DeletePostDTOSerializer implements StructuredSerializer<DeletePostDTO> {
    @override
    final Iterable<Type> types = const [DeletePostDTO, _$DeletePostDTO];

    @override
    final String wireName = r'DeletePostDTO';

    @override
    Iterable<Object?> serialize(Serializers serializers, DeletePostDTO object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'id')
            ..add(serializers.serialize(object.id,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    DeletePostDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = DeletePostDTOBuilder();

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
            }
        }
        return result.build();
    }
}

