import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> uploadBabelTranslationsChangesCommitToServer({
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
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to upload commit data',
        description:
            'Unable to upload the translation commit data to the server. This may be due to API connection issues or invalid project credentials. Please verify your API key and try again',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

AsyncBabelResult<GenerateFlowSincronizedBabelCommitWithApi>
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
