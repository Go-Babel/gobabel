import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<String> generateBabelClassUsecase({
  required BigInt projectShaIdentifier,
  required Set<BabelFunctionDeclaration> declarationFunctions,
}) async {
  try {
    return generateBabelClass(
      projectShaIdentifier: projectShaIdentifier,
      declarationFunctions: declarationFunctions,
    ).toSuccess();
  } catch (e) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to generate Babel class',
        description: e.toString(),
      ),
    ).toFailure();
  }
}

AsyncBabelResult<GenerateFlowGeneratedBabelClass>
generate_generateBabelClassUsecase(
  GenerateFlowReplacedHardcodedStringsForBabelText payload,
) async {
  final babelClassResult = await generateBabelClassUsecase(
    projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
    declarationFunctions:
        payload.hardcodedStringsPayloadInfo.keyToDeclaration.values.toSet(),
  );

  if (babelClassResult.isError()) {
    return babelClassResult.asBabelResultErrorAsync();
  }

  final String babelClass = babelClassResult.getOrThrow();

  return GenerateFlowGeneratedBabelClass(
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
    babelClass: babelClass,
  ).toSuccess();
}

AsyncBabelResult<SyncFlowGeneratedBabelClass>
sync_generateBabelClassUsecase(
  SyncFlowExtractedBabelFunctionDeclarations payload,
) async {
  final babelClassResult = await generateBabelClassUsecase(
    projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
    declarationFunctions: payload.declarationFunctions,
  );

  if (babelClassResult.isError()) {
    return babelClassResult.asBabelResultErrorAsync();
  }

  final String babelClass = babelClassResult.getOrThrow();

  return SyncFlowGeneratedBabelClass(
    willLog: payload.willLog,
    accountApiKey: payload.accountApiKey,
    directoryPath: payload.directoryPath,
    client: payload.client,
    yamlInfo: payload.yamlInfo,
    gitVariables: payload.gitVariables,
    contextPaths: payload.contextPaths,
    declarationFunctions: payload.declarationFunctions,
    babelClass: babelClass,
  ).toSuccess();
}
