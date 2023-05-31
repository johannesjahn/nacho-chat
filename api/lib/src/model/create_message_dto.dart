//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_message_dto.g.dart';

/// CreateMessageDTO
///
/// Properties:
/// * [conversationId] 
/// * [content] 
/// * [contentType] 
@BuiltValue()
abstract class CreateMessageDTO implements Built<CreateMessageDTO, CreateMessageDTOBuilder> {
  @BuiltValueField(wireName: r'conversationId')
  num get conversationId;

  @BuiltValueField(wireName: r'content')
  String get content;

  @BuiltValueField(wireName: r'contentType')
  CreateMessageDTOContentTypeEnum get contentType;
  // enum contentTypeEnum {  TEXT,  IMAGE_URL,  };

  CreateMessageDTO._();

  factory CreateMessageDTO([void updates(CreateMessageDTOBuilder b)]) = _$CreateMessageDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateMessageDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateMessageDTO> get serializer => _$CreateMessageDTOSerializer();
}

class _$CreateMessageDTOSerializer implements PrimitiveSerializer<CreateMessageDTO> {
  @override
  final Iterable<Type> types = const [CreateMessageDTO, _$CreateMessageDTO];

  @override
  final String wireName = r'CreateMessageDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateMessageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'conversationId';
    yield serializers.serialize(
      object.conversationId,
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
      specifiedType: const FullType(CreateMessageDTOContentTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateMessageDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateMessageDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'conversationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.conversationId = valueDes;
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
            specifiedType: const FullType(CreateMessageDTOContentTypeEnum),
          ) as CreateMessageDTOContentTypeEnum;
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
  CreateMessageDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateMessageDTOBuilder();
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

class CreateMessageDTOContentTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'TEXT')
  static const CreateMessageDTOContentTypeEnum TEXT = _$createMessageDTOContentTypeEnum_TEXT;
  @BuiltValueEnumConst(wireName: r'IMAGE_URL')
  static const CreateMessageDTOContentTypeEnum IMAGE_URL = _$createMessageDTOContentTypeEnum_IMAGE_URL;

  static Serializer<CreateMessageDTOContentTypeEnum> get serializer => _$createMessageDTOContentTypeEnumSerializer;

  const CreateMessageDTOContentTypeEnum._(String name): super(name);

  static BuiltSet<CreateMessageDTOContentTypeEnum> get values => _$createMessageDTOContentTypeEnumValues;
  static CreateMessageDTOContentTypeEnum valueOf(String name) => _$createMessageDTOContentTypeEnumValueOf(name);
}

