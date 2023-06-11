//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_post_dto.g.dart';

/// UpdatePostDTO
///
/// Properties:
/// * [id] - The unique id of a post
/// * [content] - The content of a post
/// * [contentType] - The content type of a post
@BuiltValue()
abstract class UpdatePostDTO implements Built<UpdatePostDTO, UpdatePostDTOBuilder> {
  /// The unique id of a post
  @BuiltValueField(wireName: r'id')
  num get id;

  /// The content of a post
  @BuiltValueField(wireName: r'content')
  String get content;

  /// The content type of a post
  @BuiltValueField(wireName: r'contentType')
  UpdatePostDTOContentTypeEnum get contentType;
  // enum contentTypeEnum {  TEXT,  IMAGE_URL,  };

  UpdatePostDTO._();

  factory UpdatePostDTO([void updates(UpdatePostDTOBuilder b)]) = _$UpdatePostDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdatePostDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdatePostDTO> get serializer => _$UpdatePostDTOSerializer();
}

class _$UpdatePostDTOSerializer implements PrimitiveSerializer<UpdatePostDTO> {
  @override
  final Iterable<Type> types = const [UpdatePostDTO, _$UpdatePostDTO];

  @override
  final String wireName = r'UpdatePostDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdatePostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(num),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'contentType';
    yield serializers.serialize(
      object.contentType,
      specifiedType: const FullType(UpdatePostDTOContentTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdatePostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdatePostDTOBuilder result,
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
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        case r'contentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpdatePostDTOContentTypeEnum),
          ) as UpdatePostDTOContentTypeEnum;
          result.contentType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdatePostDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdatePostDTOBuilder();
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

class UpdatePostDTOContentTypeEnum extends EnumClass {

  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'TEXT')
  static const UpdatePostDTOContentTypeEnum TEXT = _$updatePostDTOContentTypeEnum_TEXT;
  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'IMAGE_URL')
  static const UpdatePostDTOContentTypeEnum IMAGE_URL = _$updatePostDTOContentTypeEnum_IMAGE_URL;

  static Serializer<UpdatePostDTOContentTypeEnum> get serializer => _$updatePostDTOContentTypeEnumSerializer;

  const UpdatePostDTOContentTypeEnum._(String name): super(name);

  static BuiltSet<UpdatePostDTOContentTypeEnum> get values => _$updatePostDTOContentTypeEnumValues;
  static UpdatePostDTOContentTypeEnum valueOf(String name) => _$updatePostDTOContentTypeEnumValueOf(name);
}

