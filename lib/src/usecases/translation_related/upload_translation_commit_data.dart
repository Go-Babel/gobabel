import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> uploadBabelTranslationsChangesCommitToServer({
  required Client client,
  required GitVariables gitVariables,
  required GitCommit babelGitCommit,
  required GenerateHistory historyItem,
}) async {
  try {
    await client.publicHistory.setCommit(
      projectShaIdentifier: gitVariables.projectShaIdentifier,
      commit: babelGitCommit,
      generateHistoryId: historyItem.id!,
    );
    return Success(unit);
  } catch (e) {
    return Exception('Error uploading commit: $e').toFailure();
  }
}

AsyncResult<GenerateFlowSincronizedBabelCommitWithApi>
generate_uploadBabelTranslationsChangesCommitToServer(
  GenerateFlowGetBabelChangesCommit payload,
) {
  return uploadBabelTranslationsChangesCommitToServer(
    client: payload.client.server,
    gitVariables: payload.gitVariables,
    babelGitCommit: payload.babelGitCommit,
    historyItem: payload.generatedHistoryItem,
  ).map((_) {
    return GenerateFlowSincronizedBabelCommitWithApi(
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
      babelGitCommit: payload.babelGitCommit,
    );
  });
}
