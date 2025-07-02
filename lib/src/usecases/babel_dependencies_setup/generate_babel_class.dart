import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<String> generateBabelClassUsecase({
  required BigInt projectShaIdentifier,
  required Set<BabelFunctionDeclaration> declarationFunctions,
}) async {
  final StringBuffer fileContent = StringBuffer(babelText);
  for (final BabelFunctionDeclaration d in declarationFunctions) {
    fileContent.write('$d\n');
  }

  fileContent.write('}');

  return fileContent
      .toString()
      .replaceAll(
        r"const String _gobabelRoute = 'http://localhost:8080';",
        "const String _gobabelRoute = 'http://gobabel.dev';",
      )
      .replaceAll(
        r"const String _projectIdentifier = '';",
        "const String _projectIdentifier = '$projectShaIdentifier';",
      )
      .toSuccess();
}

AsyncBabelResult<GenerateFlowGeneratedBabelClass>
generate_generateBabelClassUsecase(
  GenerateFlowAppliedCodebaseGeneralDartFixes payload,
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
    babelClass: babelClass,
  ).toSuccess();
}
