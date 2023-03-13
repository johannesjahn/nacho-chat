//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_reply_dto.g.dart';

/// CreateReplyDTO
///
/// Properties:
/// * [commentId] 
/// * [content] 
@BuiltValue()
abstract class CreateReplyDTO implements Built<CreateReplyDTO, CreateReplyDTOBuilder> {
  @BuiltValueField(wireName: r'commentId')
  num get commentId;

  @BuiltValueField(wireName: r'content')
  String get content;

  CreateReplyDTO._();

  factory CreateReplyDTO([void updates(CreateReplyDTOBuilder b)]) = _$CreateReplyDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateReplyDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateReplyDTO> get serializer => _$CreateReplyDTOSerializer();
}

class _$CreateReplyDTOSerializer implements PrimitiveSerializer<CreateReplyDTO> {
  @override
  final Iterable<Type> types = const [CreateReplyDTO, _$CreateReplyDTO];

  @override
  final String wireName = r'CreateReplyDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateReplyDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'commentId';
    yield serializers.serialize(
      object.commentId,
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
    CreateReplyDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateReplyDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'commentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.commentId = valueDes;
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
  CreateReplyDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateReplyDTOBuilder();
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

