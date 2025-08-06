// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilesVerificationFromZeroImpl _$$FilesVerificationFromZeroImplFromJson(
        Map<String, dynamic> json) =>
    _$FilesVerificationFromZeroImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FilesVerificationFromZeroImplToJson(
        _$FilesVerificationFromZeroImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FilesVerificationFromLastCommitImpl
    _$$FilesVerificationFromLastCommitImplFromJson(Map<String, dynamic> json) =>
        _$FilesVerificationFromLastCommitImpl(
          changedFilesPath: (json['changedFilesPath'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$FilesVerificationFromLastCommitImplToJson(
        _$FilesVerificationFromLastCommitImpl instance) =>
    <String, dynamic>{
      'changedFilesPath': instance.changedFilesPath,
      'runtimeType': instance.$type,
    };
