import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<GitCommit> getLastLocalCommitInCurrentBranch({
  required String dirrPath,
}) async {
  const String delimiter = '|||GIT_COMMIT_FIELD_DELIMITER|||';
  // Git log format specifiers:
  // %H: commit hash
  // %an: author name
  // %ae: author email
  // %aI: author date, strict ISO 8601 format (good for DateTime.parse)
  // %s: subject (first line of commit message)
  // Note: For the full commit message (subject + body), use %B. For this example, %s is simpler.
  const String gitLogFormat =
      '"%H$delimiter%an$delimiter%ae$delimiter%aI$delimiter%s"';

  final result = await BabelProcessRunner.run(
    command: 'git log -1 --pretty=format:$gitLogFormat',
    dirrPath: dirrPath,
  );

  if (result.exitCode != 0) {
    return Exception('Failed to get last commit: ${result.stderr}').toFailure();
  }

  final output = result.stdout.toString().trim();
  final parts = output.split(delimiter);

  // git log -1 --pretty=format:%H|%an|%ae|%ad|%s
  // git log -1 --pretty=format:"%H$|||GIT_COMMIT_FIELD_DELIMITER|||%an$|||GIT_COMMIT_FIELD_DELIMITER|||%ae$|||GIT_COMMIT_FIELD_DELIMITER|||%aI$|||GIT_COMMIT_FIELD_DELIMITER|||%s"

  if (parts.length < 5) {
    return Exception('⚠️ Unexpected git log output: $output').toFailure();
  }

  return GitCommit(
    shaHash: parts[0],
    authorName: parts[1],
    authorEmail: parts[2],
    date: DateTime.parse(parts[3]),
    message: parts.sublist(4).join('|'), // in case the message has '|'
  ).toSuccess();
}

AsyncResult<CreateFlowGotLastLocalCommit>
create_getLastLocalCommitInCurrentBranch(CreateFlowGotGitUser payload) async {
  final lastCommitResult = await getLastLocalCommitInCurrentBranch(
    dirrPath: payload.directoryPath,
  );

  return lastCommitResult.flatMap((lastCommit) {
    return CreateFlowGotLastLocalCommit(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: payload.gitUser,
      previousCommit: lastCommit,
    ).toSuccess();
  });
}

AsyncResult<SyncFlowGotLastLocalCommit> sync_getLastLocalCommitInCurrentBranch(
  SyncFlowGotGitUser payload,
) async {
  final lastCommitResult = await getLastLocalCommitInCurrentBranch(
    dirrPath: payload.directoryPath,
  );

  return lastCommitResult.flatMap((lastCommit) {
    return SyncFlowGotLastLocalCommit(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: payload.gitUser,
      previousCommit: lastCommit,
    ).toSuccess();
  });
}

AsyncResult<GenerateFlowGotLastLocalCommit>
generate_getLastLocalCommitInCurrentBranch(
  GenerateFlowGotGitUser payload,
) async {
  final lastCommitResult = await getLastLocalCommitInCurrentBranch(
    dirrPath: payload.directoryPath,
  );

  return lastCommitResult.flatMap((lastCommit) {
    return GenerateFlowGotLastLocalCommit(
      inputedByUserLocale: payload.inputedByUserLocale,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: payload.gitUser,
      previousCommit: lastCommit,
    ).toSuccess();
  });
}
