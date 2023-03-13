//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_comment_dto.g.dart';

/// CreateCommentDTO
///
/// Properties:
/// * [postId] 
/// * [content] 
@BuiltValue()
abstract class CreateCommentDTO implements Built<CreateCommentDTO, CreateCommentDTOBuilder> {
  @BuiltValueField(wireName: r'postId')
  num get postId;

  @BuiltValueField(wireName: r'content')
  String get content;

  CreateCommentDTO._();

  factory CreateCommentDTO([void updates(CreateCommentDTOBuilder b)]) = _$CreateCommentDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCommentDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCommentDTO> get serializer => _$CreateCommentDTOSerializer();
}

class _$CreateCommentDTOSerializer implements PrimitiveSerializer<CreateCommentDTO> {
  @override
  final Iterable<Type> types = const [CreateCommentDTO, _$CreateCommentDTO];

  @override
  final String wireName = r'CreateCommentDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'postId';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(num),
    );
    yield r'content';
    yield serializers.serialize(
      object.content,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateCommentDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateCommentDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'postId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.postId = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.content = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateCommentDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCommentDTOBuilder();
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

