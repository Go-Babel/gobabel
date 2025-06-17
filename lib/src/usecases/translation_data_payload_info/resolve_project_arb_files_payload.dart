// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
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

AsyncResult<ResolveProjectArbFilesPayloadResponse>
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

    for (final entry
        in arbDataStateWithData
            .mainPreMadeTranslationArb!
            .allKeyValues
            .entries) {
      final TranslationKey rawKey = entry.key;
      final HardCodedString value = entry.value;
      final integrityKeyResponse = garanteeKeyIntegrity(
        key: rawKey,
        value: value,
      );
      if (integrityKeyResponse.isError()) {
        return integrityKeyResponse.asError();
      }
      final ProcessedKeyIntegrity processedKey =
          integrityKeyResponse.getOrThrow();

      hardcodedStringToKeyCache[value] = processedKey;

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

    final payloadInfo = TranslationPayloadInfo(
      hardcodedStringToKeyCache: hardcodedStringToKeyCache,
      keyToDeclaration: keyToDeclaration,
      keyToImplementation: keyToImplementation,
      keyToContextsPaths: {},
    );

    return ResolveProjectArbFilesPayloadResponse(
      payloadInfo: payloadInfo,
      remapedArbKeys: remapedArbKeys,
    ).toSuccess();
  } catch (e) {
    return Exception('Error creating translation payload: $e').toFailure();
  }
}

AsyncResult<GenerateFlowResolvedProjectArbTranslationPayload>
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
      downloadLink: payload.downloadLink,
      referenceArbMap: payload.referenceArbMap,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: payload.filesVerificationState,
      projectArbData: payload.projectArbData,
      codebaseArbTranslationPayloadInfo: response.payloadInfo,
      remapedArbKeys: response.remapedArbKeys,
    ).toSuccess();
  });
}
