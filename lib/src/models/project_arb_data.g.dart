// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_arb_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArbDataStateWithDataImpl _$$ArbDataStateWithDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ArbDataStateWithDataImpl(
      config:
          L10nProjectConfig.fromJson(json['config'] as Map<String, dynamic>),
      variablesPlaceholdersPerKey:
          (json['variablesPlaceholdersPerKey'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toSet()),
      ),
      mainLocale: const BabelSupportedLocalesJsonConverter()
          .fromJson(json['mainLocale'] as Map<String, dynamic>),
      preMadeTranslationArb: (json['preMadeTranslationArb'] as List<dynamic>)
          .map((e) => ArbFileData.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ArbDataStateWithDataImplToJson(
        _$ArbDataStateWithDataImpl instance) =>
    <String, dynamic>{
      'config': instance.config,
      'variablesPlaceholdersPerKey': instance.variablesPlaceholdersPerKey
          .map((k, e) => MapEntry(k, e.toList())),
      'mainLocale': const BabelSupportedLocalesJsonConverter()
          .toJson(instance.mainLocale),
      'preMadeTranslationArb': instance.preMadeTranslationArb,
      'runtimeType': instance.$type,
    };

_$ArbDataStateNoneDataImpl _$$ArbDataStateNoneDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ArbDataStateNoneDataImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ArbDataStateNoneDataImplToJson(
        _$ArbDataStateNoneDataImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ArbFileDataImpl _$$ArbFileDataImplFromJson(Map<String, dynamic> json) =>
    _$ArbFileDataImpl(
      locale: const BabelSupportedLocalesJsonConverter()
          .fromJson(json['locale'] as Map<String, dynamic>),
      allKeyValues: Map<String, String>.from(json['allKeyValues'] as Map),
    );

Map<String, dynamic> _$$ArbFileDataImplToJson(_$ArbFileDataImpl instance) =>
    <String, dynamic>{
      'locale':
          const BabelSupportedLocalesJsonConverter().toJson(instance.locale),
      'allKeyValues': instance.allKeyValues,
    };
