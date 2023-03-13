//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_post_dto.g.dart';

/// DeletePostDTO
///
/// Properties:
/// * [id] 
@BuiltValue()
abstract class DeletePostDTO implements Built<DeletePostDTO, DeletePostDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  num get id;

  DeletePostDTO._();

  factory DeletePostDTO([void updates(DeletePostDTOBuilder b)]) = _$DeletePostDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeletePostDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeletePostDTO> get serializer => _$DeletePostDTOSerializer();
}

class _$DeletePostDTOSerializer implements PrimitiveSerializer<DeletePostDTO> {
  @override
  final Iterable<Type> types = const [DeletePostDTO, _$DeletePostDTO];

  @override
  final String wireName = r'DeletePostDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeletePostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeletePostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeletePostDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeletePostDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeletePostDTOBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

