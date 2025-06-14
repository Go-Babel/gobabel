import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<TranslationPayloadInfo> createTranslationPayload() async {
  try {
    final payloadInfo = TranslationPayloadInfo(
      hardcodedStringToKeyCache: {},
      keyToDeclaration: {},
      keyToImplementation: {},
      keyToContextsPaths: {},
    );
    return payloadInfo.toSuccess();
  } catch (e) {
    return Exception('Error creating translation payload: $e').toFailure();
  }
}

AsyncResult<GenerateFlowCreatedInitialTranslationPayloadInfo>
generate_createTranslationPayload(GenerateFlowProjectCacheMap payload) {
  return createTranslationPayload().flatMap((payloadInfo) {
    return GenerateFlowCreatedInitialTranslationPayloadInfo(
      referenceArbMap: payload.referenceArbMap,
      projectCacheMap: payload.projectCacheMap,
      inputedByUserLocale: payload.inputedByUserLocale,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      downloadLink: payload.downloadLink,
      translationPayloadInfo: payloadInfo,
    ).toSuccess();
  });
}
