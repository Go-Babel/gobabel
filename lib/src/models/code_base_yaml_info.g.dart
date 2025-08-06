// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_base_yaml_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CodeBaseYamlInfoImpl _$$CodeBaseYamlInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CodeBaseYamlInfoImpl(
      projectName: json['projectName'] as String,
      projectDescription: json['projectDescription'] as String?,
      version: json['version'] as String,
      type: $enumDecode(_$ProjectTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$CodeBaseYamlInfoImplToJson(
        _$CodeBaseYamlInfoImpl instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
      'projectDescription': instance.projectDescription,
      'version': instance.version,
      'type': _$ProjectTypeEnumMap[instance.type]!,
    };

const _$ProjectTypeEnumMap = {
  ProjectType.flutter: 'flutter',
  ProjectType.dart: 'dart',
};
