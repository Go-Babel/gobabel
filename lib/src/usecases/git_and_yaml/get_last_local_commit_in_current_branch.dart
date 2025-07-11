import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<GitCommit> getLastLocalCommitInCurrentBranch({
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

  final resultAsync = await runBabelProcess(
    command: 'git log -1 --pretty=format:$gitLogFormat',
    dirrPath: dirrPath,
  );

  return resultAsync.fold((result) {
    if (result.exitCode != 0) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Failed to get last commit',
          description:
              'Could not retrieve the last commit information. '
              'Please ensure you have at least one commit in your repository. '
              'Error: ${result.stderr}',
        ),
      ).toFailure();
    }

    final output = result.stdout.toString().trim();
    final parts = output.split(delimiter);

    // git log -1 --pretty=format:%H|%an|%ae|%ad|%s
    // git log -1 --pretty=format:"%H$|||GIT_COMMIT_FIELD_DELIMITER|||%an$|||GIT_COMMIT_FIELD_DELIMITER|||%ae$|||GIT_COMMIT_FIELD_DELIMITER|||%aI$|||GIT_COMMIT_FIELD_DELIMITER|||%s"

    if (parts.length < 5) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Unexpected git log format',
          description:
              'The git log command returned unexpected output. '
              'This might be due to an incompatible Git version or custom configuration. '
              'Output received: $output',
        ),
      ).toFailure();
    }

    return GitCommit(
      shaHash: parts[0],
      authorName: parts[1],
      authorEmail: parts[2],
      date: DateTime.parse(parts[3]),
      message: parts.sublist(4).join('|'), // in case the message has '|'
    ).toSuccess();
  }, (failure) => Failure(failure));
}

AsyncBabelResult<CreateFlowGotLastLocalCommit>
create_getLastLocalCommitInCurrentBranch(CreateFlowGotGitUser payload) async {
  final lastCommitResult = await getLastLocalCommitInCurrentBranch(
    dirrPath: payload.directoryPath,
  );

  return lastCommitResult.flatMap((lastCommit) {
    return CreateFlowGotLastLocalCommit(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: payload.gitUser,
      previousCommit: lastCommit,
    ).toSuccess();
  });
}

AsyncBabelResult<SyncFlowGotLastLocalCommit>
sync_getLastLocalCommitInCurrentBranch(SyncFlowGotGitUser payload) async {
  final lastCommitResult = await getLastLocalCommitInCurrentBranch(
    dirrPath: payload.directoryPath,
  );

  return lastCommitResult.flatMap((lastCommit) {
    return SyncFlowGotLastLocalCommit(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: payload.gitUser,
      previousCommit: lastCommit,
    ).toSuccess();
  });
}

AsyncBabelResult<GenerateFlowGotLastLocalCommit>
generate_getLastLocalCommitInCurrentBranch(
  GenerateFlowGotGitUser payload,
) async {
  final lastCommitResult = await getLastLocalCommitInCurrentBranch(
    dirrPath: payload.directoryPath,
  );

  return lastCommitResult.flatMap((lastCommit) {
    return GenerateFlowGotLastLocalCommit(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: payload.gitUser,
      previousCommit: lastCommit,
    ).toSuccess();
  });
}

AsyncBabelResult<GenerateFlowGetBabelChangesCommit>
generate_getBabelChangesCommit(
  GenerateFlowCommitedAllChangesOfCodebase payload,
) async {
  final lastCommitResult = await getLastLocalCommitInCurrentBranch(
    dirrPath: payload.directoryPath,
  );

  return lastCommitResult.flatMap((lastCommit) {
    return GenerateFlowGetBabelChangesCommit(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: payload.filesVerificationState,
      projectArbData: payload.projectArbData,
      remapedArbKeys: payload.remapedArbKeys,
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
      contextPaths: payload.contextPaths,
      madeTranslations: payload.madeTranslations,
      generatedHistoryItem: payload.generatedHistoryItem,
      babelGitCommit: lastCommit,
    ).toSuccess();
  });
}
