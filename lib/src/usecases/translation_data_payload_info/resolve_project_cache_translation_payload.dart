import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<TranslationPayloadInfo> resolveProjectCacheTranslationPayload(
  ProjectCacheMap projectCacheMap,
) async {
  try {
    final payloadInfo = TranslationPayloadInfo(
      hardcodedStringToKeyCache: {
        ...projectCacheMap.hardcodedStringToArbKeyMap,
      },
      keyToDeclaration: {...projectCacheMap.arbKeyToDeclarationFunctionMap},
      keyToImplementation: {
        ...projectCacheMap.arbKeyToImplementationFunctionMap,
      },
      keyToContextsPaths: {},
    );
    return payloadInfo.toSuccess();
  } catch (e) {
    return Exception('Error creating translation payload: $e').toFailure();
  }
}

AsyncResult<GenerateFlowResolvedProjectCacheTranslation>
generate_resolveProjectCacheTranslationPayload(
  GenerateFlowProjectCacheMap payload,
) {
  return resolveProjectCacheTranslationPayload(payload.projectCacheMap).flatMap(
    (payloadInfo) {
      return GenerateFlowResolvedProjectCacheTranslation(
        referenceArbMap: payload.referenceArbMap,
        accountApiKey: payload.accountApiKey,
        directoryPath: payload.directoryPath,
        inputedByUserLocale: payload.inputedByUserLocale,
        client: payload.client,
        yamlInfo: payload.yamlInfo,
        gitVariables: payload.gitVariables,
        maxLanguageCount: payload.maxLanguageCount,
        languages: payload.languages,
        downloadLink: payload.downloadLink,
        projectCacheMap: payload.projectCacheMap,
        cacheMapTranslationPayloadInfo: payloadInfo,
      ).toSuccess();
    },
  );
}
