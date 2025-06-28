// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_variables.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitVariablesImpl _$$GitVariablesImplFromJson(Map<String, dynamic> json) =>
    _$GitVariablesImpl(
      user: GitUser.fromJson(json['user'] as Map<String, dynamic>),
      previousCommit: GitCommit.fromJson(
        json['previousCommit'] as Map<String, dynamic>,
      ),
      latestShaIdentifier: json['latestShaIdentifier'] as String,
      originUrl: json['originUrl'] as String,
      projectShaIdentifier: BigInt.parse(
        json['projectShaIdentifier'] as String,
      ),
    );

Map<String, dynamic> _$$GitVariablesImplToJson(_$GitVariablesImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'previousCommit': instance.previousCommit,
      'latestShaIdentifier': instance.latestShaIdentifier,
      'originUrl': instance.originUrl,
      'projectShaIdentifier': instance.projectShaIdentifier.toString(),
    };
