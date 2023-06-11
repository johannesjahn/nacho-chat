//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_reply_dto.g.dart';

/// UpdateReplyDTO
///
/// Properties:
/// * [replyId] - The unique id of the reply
/// * [content] - The content of the reply
@BuiltValue()
abstract class UpdateReplyDTO implements Built<UpdateReplyDTO, UpdateReplyDTOBuilder> {
  /// The unique id of the reply
  @BuiltValueField(wireName: r'replyId')
  num get replyId;

  /// The content of the reply
  @BuiltValueField(wireName: r'content')
  String get content;

  UpdateReplyDTO._();

  factory UpdateReplyDTO([void updates(UpdateReplyDTOBuilder b)]) = _$UpdateReplyDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateReplyDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateReplyDTO> get serializer => _$UpdateReplyDTOSerializer();
}

class _$UpdateReplyDTOSerializer implements PrimitiveSerializer<UpdateReplyDTO> {
  @override
  final Iterable<Type> types = const [UpdateReplyDTO, _$UpdateReplyDTO];

  @override
  final String wireName = r'UpdateReplyDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateReplyDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'replyId';
    yield serializers.serialize(
      object.replyId,
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
    UpdateReplyDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateReplyDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'replyId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.replyId = valueDes;
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
  UpdateReplyDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateReplyDTOBuilder();
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

