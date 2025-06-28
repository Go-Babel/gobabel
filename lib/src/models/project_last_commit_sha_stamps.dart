import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_last_commit_sha_stamps.freezed.dart';
part 'project_last_commit_sha_stamps.g.dart';

@freezed
class ProjectLastCommitShaStamps with _$ProjectLastCommitShaStamps {
  const factory ProjectLastCommitShaStamps({
    required String lastCommitShaShort,
    required String lastCommitShaFull,
  }) = _ProjectLastCommitShaStamps;

  factory ProjectLastCommitShaStamps.fromJson(Map<String, dynamic> json) =>
      _$ProjectLastCommitShaStampsFromJson(json);
}
