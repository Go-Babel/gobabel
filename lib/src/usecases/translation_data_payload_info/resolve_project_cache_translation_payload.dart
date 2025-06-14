import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<TranslationPayloadInfo> resolveProjectCacheTranslationPayload(
  ProjectCacheMap projectCacheMap,
) async {
  try {
    final payloadInfo = TranslationPayloadInfo(
      hardcodedStringToKeyCache: {
        ...projectCacheMap.hardcodedStringKeyToTranslationKeyMap,
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
