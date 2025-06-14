import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_client/gobabel_client.dart';

part 'git_variables.freezed.dart';
part 'git_variables.g.dart';

@freezed
abstract class GitVariables with _$GitVariables {
  factory GitVariables({
    required GitUser user,
    required GitCommit previousCommit,
    required String latestShaIdentifier,
    required String originUrl,
    required BigInt projectShaIdentifier,
  }) = _GitVariables;
  factory GitVariables.fromJson(Map<String, dynamic> json) =>
      _$GitVariablesFromJson(json);
}
