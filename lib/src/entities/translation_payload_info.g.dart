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
  referenceMap:
      (json['referenceMap'] as List<dynamic>)
          .map((e) => Translatables.fromJson(e as Map<String, dynamic>))
          .toList(),
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
  'referenceMap': instance.referenceMap,
};

_$TranslatablesImpl _$$TranslatablesImplFromJson(Map<String, dynamic> json) =>
    _$TranslatablesImpl(
      locale: const BabelSupportedLocalesJsonConverter().fromJson(
        json['locale'] as Map<String, dynamic>,
      ),
      referenceMap: Map<String, String>.from(json['referenceMap'] as Map),
    );

Map<String, dynamic> _$$TranslatablesImplToJson(
  _$TranslatablesImpl instance,
) => <String, dynamic>{
  'locale': const BabelSupportedLocalesJsonConverter().toJson(instance.locale),
  'referenceMap': instance.referenceMap,
};
