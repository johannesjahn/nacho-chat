//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_post_dto.g.dart';

/// CreatePostDTO
///
/// Properties:
/// * [content] - The content of a post
/// * [contentType] - The content type of a post
@BuiltValue()
abstract class CreatePostDTO implements Built<CreatePostDTO, CreatePostDTOBuilder> {
  /// The content of a post
  @BuiltValueField(wireName: r'content')
  String get content;

  /// The content type of a post
  @BuiltValueField(wireName: r'contentType')
  CreatePostDTOContentTypeEnum get contentType;
  // enum contentTypeEnum {  TEXT,  IMAGE_URL,  AUDIO_URL,  };

  CreatePostDTO._();

  factory CreatePostDTO([void updates(CreatePostDTOBuilder b)]) = _$CreatePostDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreatePostDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreatePostDTO> get serializer => _$CreatePostDTOSerializer();
}

class _$CreatePostDTOSerializer implements PrimitiveSerializer<CreatePostDTO> {
  @override
  final Iterable<Type> types = const [CreatePostDTO, _$CreatePostDTO];

  @override
  final String wireName = r'CreatePostDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreatePostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
    yield r'contentType';
    yield serializers.serialize(
      object.contentType,
      specifiedType: const FullType(CreatePostDTOContentTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreatePostDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreatePostDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(CreatePostDTOContentTypeEnum),
          ) as CreatePostDTOContentTypeEnum;
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
  CreatePostDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreatePostDTOBuilder();
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

class CreatePostDTOContentTypeEnum extends EnumClass {

  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'TEXT')
  static const CreatePostDTOContentTypeEnum TEXT = _$createPostDTOContentTypeEnum_TEXT;
  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'IMAGE_URL')
  static const CreatePostDTOContentTypeEnum IMAGE_URL = _$createPostDTOContentTypeEnum_IMAGE_URL;
  /// The content type of a post
  @BuiltValueEnumConst(wireName: r'AUDIO_URL')
  static const CreatePostDTOContentTypeEnum AUDIO_URL = _$createPostDTOContentTypeEnum_AUDIO_URL;

  static Serializer<CreatePostDTOContentTypeEnum> get serializer => _$createPostDTOContentTypeEnumSerializer;

  const CreatePostDTOContentTypeEnum._(String name): super(name);

  static BuiltSet<CreatePostDTOContentTypeEnum> get values => _$createPostDTOContentTypeEnumValues;
  static CreatePostDTOContentTypeEnum valueOf(String name) => _$createPostDTOContentTypeEnumValueOf(name);
}

