import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<TranslationPayloadInfo> resolveProjectCacheTranslationPayload(
  ProjectCacheMap projectCacheMap,
) async {
  try {
    final Map<HardCodedString, TranslationKey> hardcodedStringToKeyCache = {};
    final Map<TranslationKey, ProcessedKeyIntegrity>
    keyToProcessedKeyIntegrity = {};
    final Map<TranslationKey, BabelFunctionDeclaration> keyToDeclaration = {};
    final Map<TranslationKey, BabelFunctionImplementation> keyToImplementation =
        {};
    final List<Translatables> referenceMap = [];

    for (final entry in projectCacheMap.hardcodedStringToArbKeyMap.entries) {
      final TranslationKey key = entry.key;
      final HardCodedString value = entry.value;
      final ResultDart<String, BabelFailureResponse> integrityKeyResponse =
          await garanteeKeyIntegrity(key: key, value: value);
      if (integrityKeyResponse.isError()) {
        return integrityKeyResponse.asBabelResultErrorAsync();
      }
      final ProcessedKeyIntegrity processedKey =
          integrityKeyResponse.getOrThrow();

      hardcodedStringToKeyCache[processedKey] = value.trimHardcodedString;
    }

    for (final entry
        in projectCacheMap.arbKeyToDeclarationFunctionMap.entries) {
      final TranslationKey rawKey = entry.key;
      final ProcessedKeyIntegrity processedKey =
          keyToProcessedKeyIntegrity[rawKey]!;
      final BabelFunctionDeclaration declaration = entry.value;

      keyToDeclaration[processedKey] = declaration;
    }

    for (final entry
        in projectCacheMap.arbKeyToImplementationFunctionMap.entries) {
      final TranslationKey rawKey = entry.key;
      final ProcessedKeyIntegrity processedKey =
          keyToProcessedKeyIntegrity[rawKey]!;
      final BabelFunctionImplementation implementation = entry.value;

      keyToImplementation[processedKey] = implementation;
    }

    final payloadInfo = TranslationPayloadInfo(
      hardcodedStringToKeyCache: hardcodedStringToKeyCache,
      keyToDeclaration: keyToDeclaration,
      keyToImplementation: keyToImplementation,
      keyToContextsPaths: {},
      referenceMap: referenceMap,
    );
    return payloadInfo.toSuccess();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to create translation payload',
        description:
            'Unable to process the project cache and create translation payload. This may be due to corrupted cache data or missing translation keys.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

AsyncBabelResult<GenerateFlowResolvedProjectCacheTranslation>
generate_resolveProjectCacheTranslationPayload(
  GenerateFlowProjectCacheMap payload,
) {
  return resolveProjectCacheTranslationPayload(payload.projectCacheMap).flatMap(
    (payloadInfo) {
      return GenerateFlowResolvedProjectCacheTranslation(
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
        cacheMapTranslationPayloadInfo: payloadInfo,
      ).toSuccess();
    },
  );
}
