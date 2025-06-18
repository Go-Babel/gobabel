import 'dart:io';

import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_yaml.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> ensureSharedPrefsIsInFlutterProject({
  required Directory directory,
  required CodeBaseYamlInfo codeBaseYamlInfo,
}) async {
  if (codeBaseYamlInfo.type == ProjectType.dart) {
    // Don't need to ensure shared preferences for non-Flutter projects
    return Success(unit);
  }

  final yamlResponse = await getProjectYaml(currentDirectory: directory);
  if (yamlResponse.isError()) return yamlResponse.asError();
  final String yamlContent = yamlResponse.getOrThrow();

  final hasDependency = RegExp(
    r'^\s*shared_preferences\s*:',
    multiLine: true,
  ).hasMatch(yamlContent);

  if (!hasDependency) {
    final result = await BabelProcessRunner.run(
      command: 'dart pub add shared_preferences',
      dirrPath: directory.path,
    );
    if (result.exitCode != 0) {
      return Exception(
        'Failed to add shared_preferences dependency',
      ).toFailure();
    }
  }

  return Success(unit);
}

AsyncResult<GenerateFlowAddedSharedPrefsInFlutterProjects>
generate_ensureSharedPrefsIsInFlutterProject(
  GenerateFlowAddedBabelClassInitializationInMain payload,
) {
  return ensureSharedPrefsIsInFlutterProject(
    codeBaseYamlInfo: payload.yamlInfo,
    directory: payload.directory,
  ).flatMap((_) {
    return GenerateFlowAddedSharedPrefsInFlutterProjects(
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
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      remapedArbKeys: payload.remapedArbKeys,
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
    ).toSuccess();
  });
}
