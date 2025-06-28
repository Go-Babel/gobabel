// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'l10n_project_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$L10nProjectConfigWithDataImpl _$$L10nProjectConfigWithDataImplFromJson(
  Map<String, dynamic> json,
) => _$L10nProjectConfigWithDataImpl(
  l10nFileName: json['l10nFileName'] as String,
  templateArbFile: json['templateArbFile'] as String,
  outputClass: json['outputClass'] as String,
  outputDir: json['outputDir'] as String,
  arbDir: json['arbDir'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$L10nProjectConfigWithDataImplToJson(
  _$L10nProjectConfigWithDataImpl instance,
) => <String, dynamic>{
  'l10nFileName': instance.l10nFileName,
  'templateArbFile': instance.templateArbFile,
  'outputClass': instance.outputClass,
  'outputDir': instance.outputDir,
  'arbDir': instance.arbDir,
  'runtimeType': instance.$type,
};

_$L10nProjectConfigNoDataImpl _$$L10nProjectConfigNoDataImplFromJson(
  Map<String, dynamic> json,
) => _$L10nProjectConfigNoDataImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$L10nProjectConfigNoDataImplToJson(
  _$L10nProjectConfigNoDataImpl instance,
) => <String, dynamic>{'runtimeType': instance.$type};
