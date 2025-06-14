// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_payload_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationPayloadInfoImpl _$$TranslationPayloadInfoImplFromJson(
  Map<String, dynamic> json,
) => _$TranslationPayloadInfoImpl(
  hardcodedStringToKeyCache: Map<String, String>.from(
    json['hardcodedStringToKeyCache'] as Map,
  ),
  keyToDeclaration: Map<String, String>.from(json['keyToDeclaration'] as Map),
  keyToImplementation: Map<String, String>.from(
    json['keyToImplementation'] as Map,
  ),
  keyToContextsPaths: (json['keyToContextsPaths'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as String).toSet()),
  ),
);

Map<String, dynamic> _$$TranslationPayloadInfoImplToJson(
  _$TranslationPayloadInfoImpl instance,
) => <String, dynamic>{
  'hardcodedStringToKeyCache': instance.hardcodedStringToKeyCache,
  'keyToDeclaration': instance.keyToDeclaration,
  'keyToImplementation': instance.keyToImplementation,
  'keyToContextsPaths': instance.keyToContextsPaths.map(
    (k, e) => MapEntry(k, e.toList()),
  ),
};
