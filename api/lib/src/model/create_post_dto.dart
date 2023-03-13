//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_post_dto.g.dart';

/// CreatePostDTO
///
/// Properties:
/// * [content] - The content of a post
/// * [contentType] 
@BuiltValue()
abstract class CreatePostDTO implements Built<CreatePostDTO, CreatePostDTOBuilder> {
  /// The content of a post
  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'contentType')
  String get contentType;

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
      specifiedType: const FullType(String),
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
            specifiedType: const FullType(String),
          ) as String;
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

