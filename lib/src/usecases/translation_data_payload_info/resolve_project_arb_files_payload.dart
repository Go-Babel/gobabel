import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/arb_related/infer_implementation_function_from_arb_keys.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<TranslationPayloadInfo> resolveProjectArbFilesPayload(
  ArbDataState arbDataState,
  TranslationPayloadInfo currentPayloadInfo,
) async {
  try {
    final ArbDataStateWithData? arbDataStateWithData = arbDataState.mapOrNull(
      withData: (value) => value,
    );
    if (arbDataStateWithData == null) {
      return currentPayloadInfo.toSuccess();
    }

    final Map<HardCodedString, TranslationKey> hardcodedStringToKeyCache = {};
    final Map<TranslationKey, ProcessedKeyIntegrity>
    keyToProcessedKeyIntegrity = {};
    final Map<TranslationKey, BabelFunctionDeclaration> keyToDeclaration = {};
    final Map<TranslationKey, BabelFunctionImplementation> keyToImplementation =
        {};

    final Map<TranslationKey, HardCodedString> keys =
        arbDataStateWithData.mainPreMadeTranslationArb!.allKeyValues;

    for (final entry in keys.entries) {
      final TranslationKey key = entry.key;
      final HardCodedString value = entry.value;
      final integrityKeyResponse = garanteeKeyIntegrity(key: key, value: value);
      if (integrityKeyResponse.isError()) {
        return integrityKeyResponse.asError();
      }
      final ProcessedKeyIntegrity processedKey =
          integrityKeyResponse.getOrThrow();

      hardcodedStringToKeyCache[value] = processedKey;
    }

    for (final entry in keys.entries) {
      final TranslationKey rawKey = entry.key;
      final ProcessedKeyIntegrity processedKey =
          keyToProcessedKeyIntegrity[rawKey]!;

      final declarationResult = inferImplementationFunctionFromArbKeys(
        variablesPlaceholdersPerKey:
            arbDataStateWithData.variablesPlaceholdersPerKey,
      );
      if (declarationResult.isError()) {
        return declarationResult.asError();
      }

      final BabelFunctionDeclaration declaration =
          declarationResult.getOrThrow();
    }

    final payloadInfo = TranslationPayloadInfo(
      hardcodedStringToKeyCache: hardcodedStringToKeyCache,
      keyToDeclaration: keyToDeclaration,
      keyToImplementation: keyToImplementation,
      keyToContextsPaths: {},
    );
    return payloadInfo.toSuccess();
  } catch (e) {
    return Exception('Error creating translation payload: $e').toFailure();
  }
}

TranslationPayloadInfo addToNew(TranslationPayloadInfo translation) {}
