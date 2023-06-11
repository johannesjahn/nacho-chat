//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'version_dto.g.dart';

/// VersionDTO
///
/// Properties:
/// * [version] - The version of the API
@BuiltValue()
abstract class VersionDTO implements Built<VersionDTO, VersionDTOBuilder> {
  /// The version of the API
  @BuiltValueField(wireName: r'version')
  String get version;

  VersionDTO._();

  factory VersionDTO([void updates(VersionDTOBuilder b)]) = _$VersionDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VersionDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VersionDTO> get serializer => _$VersionDTOSerializer();
}

class _$VersionDTOSerializer implements PrimitiveSerializer<VersionDTO> {
  @override
  final Iterable<Type> types = const [VersionDTO, _$VersionDTO];

  @override
  final String wireName = r'VersionDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VersionDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'version';
    yield serializers.serialize(
      object.version,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VersionDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VersionDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.version = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VersionDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VersionDTOBuilder();
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

