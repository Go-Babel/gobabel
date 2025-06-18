import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> commitAllChangesUsecase({
  required CodeBaseYamlInfo yamlInfo,
  required Directory dirrPath,
}) async {
  // 1. Stage all changes
  final addResult = await BabelProcessRunner.run(
    command: 'git add .',
    dirrPath: dirrPath.path,
  );
  if (addResult.exitCode != 0) {
    final output = addResult.stdout as String;
    print(output.cadetBlue);
    return Exception(
      'GOBABEL bot could not stage translation changes.\n>> Now, you should stage the changes manually\nThis could be a problem with your git configuration.\nAlso, double-check if cli have the permissions for making commits\nPlease check if you have a valid git user configured.',
    ).toFailure();
  }

  final versionText = yamlInfo.version;
  // 2. Commit with your generated message and custom author
  final message =
      'Gobabel translation | $versionText\n\ngobabel static translation analysis number for version $versionText';
  final author = 'Gobabel Bot <admin@gobabel.io>';
  final commitResult = await BabelProcessRunner.run(
    command: 'git commit -m "$message" --author "$author"',
    dirrPath: dirrPath.path,
  );

  if (commitResult.exitCode != 0) {
    return Exception(
      'GOBABEL bot could not commit translation changes.\n>> Now, you should commit the changes manually\nThis could be a problem with your git configuration.\nAlso, double-check if cli have the permissions for making commits\nPlease check if you have a valid git user configured.',
    ).toFailure();
  }

  // 3. Push to the current branch
  final pushResult = await BabelProcessRunner.run(
    command: 'git push -u origin HEAD',
    dirrPath: dirrPath.path,
  );

  if (pushResult.exitCode != 0) {
    final output = pushResult.stderr as String;
    print(
      '(${pushResult.exitCode}) output: ${output.green}',
    ); //TODO(igor): Remove this, only for debugging
    return Exception(
      'GOBABEL bot could not push translation changes.\n>> Now, you should push the changes manually\nThis could be a problem with your git configuration.\nAlso, double-check if cli have the permissions for making commits\nPlease check if you have a valid git user configured.',
    ).toFailure();
  }

  return Success(unit);
}

AsyncResult<GenerateFlowCommitedAllChangesOfCodebase>
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
      downloadLink: payload.downloadLink,
      referenceArbMap: payload.referenceArbMap,
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
