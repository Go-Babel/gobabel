import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> commitAllChangesUsecase({
  required CodeBaseYamlInfo yamlInfo,
  required Directory dirrPath,
}) async {
  // 1. Stage all changes
  final addResultAsync = await runBabelProcess(
    command: 'git add .',
    dirrPath: dirrPath.path,
  );

  if (addResultAsync.isError()) {
    return Failure(addResultAsync.exceptionOrNull()!);
  }

  final addResult = addResultAsync.getOrNull()!;
  if (addResult.exitCode != 0) {
    final output = addResult.stdout as String;
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to stage changes',
        description:
            'GoBabel bot could not stage translation changes. '
            'Please stage the changes manually with "git add ." '
            'This could be due to Git configuration issues or insufficient permissions. '
            'Ensure the CLI has permissions to make commits and that Git is properly configured.\n'
            'Output: "${output.cadetBlue}"',
      ),
    ).toFailure();
  }

  final versionText = yamlInfo.version;
  // 2. Commit with your generated message and custom author
  final message =
      'Gobabel translation | $versionText\n\ngobabel static translation analysis number for version $versionText';
  final author = 'Gobabel Bot <admin@gobabel.io>';
  final commitResultAsync = await runBabelProcess(
    command: 'git commit -m "$message" --author "$author"',
    dirrPath: dirrPath.path,
  );

  if (commitResultAsync.isError()) {
    return Failure(commitResultAsync.exceptionOrNull()!);
  }

  final commitResult = commitResultAsync.getOrNull()!;
  if (commitResult.exitCode != 0) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to commit changes',
        description:
            'GoBabel bot could not commit translation changes. '
            'Please commit the changes manually with "git commit -m \'Your message\'" '
            'This could be due to Git configuration issues or insufficient permissions. '
            'Ensure you have a valid Git user configured with "git config user.name" and "git config user.email".',
      ),
    ).toFailure();
  }

  // 3. Push to the current branch
  final pushResultAsync = await runBabelProcess(
    command: 'git push -u origin HEAD',
    dirrPath: dirrPath.path,
  );

  if (pushResultAsync.isError()) {
    return Failure(pushResultAsync.exceptionOrNull()!);
  }

  final pushResult = pushResultAsync.getOrNull()!;
  if (pushResult.exitCode != 0) {
    // final output = pushResult.stderr as String;
    // print(
    //   '(${pushResult.exitCode}) output: ${output.green}',
    // ); //TODO(igor): Remove this, only for debugging
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to push changes',
        description:
            'GoBabel bot could not push translation changes to remote. '
            'Please push the changes manually with "git push" '
            'This could be due to authentication issues, network problems, or branch protection rules. '
            'Check your Git credentials and ensure you have push permissions to the repository.',
      ),
    ).toFailure();
  }

  return Success(unit);
}

AsyncBabelResult<GenerateFlowCommitedAllChangesOfCodebase>
generate_commitAllChangesUsecase(GenerateFlowUploadedNewTranslations payload) {
  return commitAllChangesUsecase(
    yamlInfo: payload.yamlInfo,
    dirrPath: payload.directory,
  ).map((_) {
    return GenerateFlowCommitedAllChangesOfCodebase(
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
    );
  });
}
