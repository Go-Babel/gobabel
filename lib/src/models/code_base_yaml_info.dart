import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_base_yaml_info.freezed.dart';

@freezed
abstract class CodeBaseYamlInfo with _$CodeBaseYamlInfo {
  factory CodeBaseYamlInfo({
    required String projectName,
    required String? projectDescription,
    required String version,
    required ProjectType type,
  }) = _CodeBaseYamlInfo;
}

enum ProjectType { flutter, dart }
