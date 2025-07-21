// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

class ResolveProjectArbFilesPayloadResponse {
  final TranslationPayloadInfo payloadInfo;
  final Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys;
  const ResolveProjectArbFilesPayloadResponse({
    required this.payloadInfo,
    required this.remapedArbKeys,
  });
}

AsyncBabelResult<ResolveProjectArbFilesPayloadResponse>
resolveProjectArbFilesPayload({
  required ArbDataState arbDataState,
  required TranslationPayloadInfo currentPayloadInfo,
}) async {
  try {
    final ArbDataStateWithData? arbDataStateWithData = arbDataState.mapOrNull(
      withData: (value) => value,
    );
    if (arbDataStateWithData == null) {
      return ResolveProjectArbFilesPayloadResponse(
        payloadInfo: currentPayloadInfo,
        remapedArbKeys: <TranslationKey, ProcessedKeyIntegrity>{},
      ).toSuccess();
    }
    final Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys = {};
    final Map<HardCodedString, TranslationKey> hardcodedStringToKeyCache = {
      ...currentPayloadInfo.hardcodedStringToKeyCache,
    };
    final Map<TranslationKey, BabelFunctionDeclaration> keyToDeclaration = {
      ...currentPayloadInfo.keyToDeclaration,
    };
    final Map<TranslationKey, BabelFunctionImplementation> keyToImplementation =
        {...currentPayloadInfo.keyToImplementation};
    final Map<BabelSupportedLocales, Map<L10nKey, L10nValue>> referenceMap = {};
    for (final Translatables element in currentPayloadInfo.referenceMap) {
      referenceMap[element.locale] = element.referenceMap;
    }
    final Map<TranslationKey, Set<ContextPath>> keyToContextsPaths = {
      ...currentPayloadInfo.keyToContextsPaths,
    };

    for (final entry
        in arbDataStateWithData
            .mainPreMadeTranslationArb!
            .allKeyValues
            .entries) {
      final TranslationKey rawKey = entry.key;
      final HardCodedString value = entry.value;
      final integrityKeyResponse = await garanteeKeyIntegrity(
        key: rawKey,
        value: value,
      );
      if (integrityKeyResponse.isError()) {
        return integrityKeyResponse.asBabelResultErrorAsync();
      }
      final ProcessedKeyIntegrity processedKey =
          integrityKeyResponse.getOrThrow();

      hardcodedStringToKeyCache[processedKey] = value.trimHardcodedString;
      remapedArbKeys[rawKey] = processedKey;

      final L10nKey l10nKey = processedKey;
      final Set<VariableName> variablesNames =
          arbDataStateWithData.variablesPlaceholdersPerKey[rawKey]!;

      BabelFunctionImplementation gobabelFunctionImplementationString =
          '$kBabelClass.$l10nKey(${variablesNames.map((e) => e).join(', ')})';

      BabelFunctionDeclaration gobabelFunctionDeclarationString =
          '''${value.trimHardcodedString.formatToComment}
  static String $l10nKey(${variablesNames.map((e) => 'Object? $e').join(', ')}) {
    return i._getByKey('$variablesNames')${variablesNames.map((e) => '.replaceAll(\'{$e}\', $e.toString())').join()};
  }''';

      keyToImplementation[processedKey] = gobabelFunctionImplementationString;
      keyToDeclaration[processedKey] = gobabelFunctionDeclarationString;
    }

    for (final val in arbDataStateWithData.preMadeTranslationArb) {
      final BabelSupportedLocales locale = val.locale;
      if (referenceMap[locale] == null) {
        referenceMap[locale] = {};
      }
      for (final entry in val.allKeyValues.entries) {
        final TranslationKey rawKey = entry.key;
        final HardCodedString value = entry.value;
        final ProcessedKeyIntegrity integrityKey = remapedArbKeys[rawKey]!;
        referenceMap[locale]![integrityKey] = value;
      }
    }

    final payloadInfo = TranslationPayloadInfo(
      hardcodedStringToKeyCache: hardcodedStringToKeyCache,
      keyToDeclaration: keyToDeclaration,
      keyToImplementation: keyToImplementation,
      keyToContextsPaths: keyToContextsPaths,
      referenceMap:
          referenceMap.entries.map(Translatables.fromEntries).toList(),
    );

    return ResolveProjectArbFilesPayloadResponse(
      payloadInfo: payloadInfo,
      remapedArbKeys: remapedArbKeys,
    ).toSuccess();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to process ARB files',
        description:
            'An error occurred while processing existing ARB translation files. Please ensure your ARB files are properly formatted and contain valid JSON.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

AsyncBabelResult<GenerateFlowResolvedProjectArbTranslationPayload>
generate_resolveProjectArbFilesPayload(
  GenerateFlowMappedProjectArbData payload,
) {
  return resolveProjectArbFilesPayload(
    arbDataState: payload.projectArbData,
    currentPayloadInfo: payload.cacheMapTranslationPayloadInfo,
  ).flatMap((response) {
    return GenerateFlowResolvedProjectArbTranslationPayload(
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
      codebaseArbTranslationPayloadInfo: response.payloadInfo,
      remapedArbKeys: response.remapedArbKeys,
    ).toSuccess();
  });
}
