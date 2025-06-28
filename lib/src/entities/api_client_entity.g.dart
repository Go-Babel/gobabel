// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiClientEntityImpl _$$ApiClientEntityImplFromJson(
  Map<String, dynamic> json,
) => _$ApiClientEntityImpl(
  host: json['host'] as String,
  connectionTimeout: Duration(
    microseconds: (json['connectionTimeout'] as num).toInt(),
  ),
);

Map<String, dynamic> _$$ApiClientEntityImplToJson(
  _$ApiClientEntityImpl instance,
) => <String, dynamic>{
  'host': instance.host,
  'connectionTimeout': instance.connectionTimeout.inMicroseconds,
};
