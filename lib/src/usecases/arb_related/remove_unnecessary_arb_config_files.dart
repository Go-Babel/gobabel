import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<GenerateFlowRemovedUnnecessaryArbConfigFiles>
generate_removeUnnecessaryArbConfigFiles(
  GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions payload,
) async {
  try {
    // Extract L10n config if available
    final L10nProjectConfigWithData? projectConfig = payload.projectArbData
        .mapOrNull(withData: (value) => value.config)
        ?.mapOrNull(withData: (value) => value);

    if (projectConfig != null) {
      // Delete outputDir (gen_l10n files)
      final outputDir = Directory(
        '${payload.directoryPath}/${projectConfig.outputDir}',
      );
      if (await outputDir.exists()) {
        print('Deleting output directory: ${outputDir.path}');
        await outputDir.delete(recursive: true);
      }

      // Delete arbDir (ARB files)
      final arbDir = Directory(
        '${payload.directoryPath}/${projectConfig.arbDir}',
      );
      if (await arbDir.exists()) {
        print('Deleting ARB directory: ${arbDir.path}');
        await arbDir.delete(recursive: true);
      }
    }

    // Run dart fix to remove unused imports
    print('Running dart fix to clean up imports...');
    final result = await Process.run('dart', [
      'fix',
      '--apply',
    ], workingDirectory: payload.directoryPath);

    if (result.exitCode != 0) {
      print(
        'Warning: dart fix returned non-zero exit code: ${result.exitCode}',
      );
      print('stdout: ${result.stdout}');
      print('stderr: ${result.stderr}');
    }

    return GenerateFlowRemovedUnnecessaryArbConfigFiles(
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
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      remapedArbKeys: payload.remapedArbKeys,
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
    ).toSuccess();
  } catch (e) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to remove ARB config files',
        description:
            'Error while removing gen_l10n and ARB files: ${e.toString()}',
      ),
    ).toFailure();
  }
}
