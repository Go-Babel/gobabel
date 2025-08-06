import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
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

      // Delete l10n config file (all variations)
      final preMappedNamesOfLanguageConfigFiles = <String>{
        'l10n.yaml',
        'L10n.yaml',
        'i10n.yaml',
        'I10n.yaml',
      };

      for (final configFileName in preMappedNamesOfLanguageConfigFiles) {
        final configFile = File('${payload.directoryPath}/$configFileName');
        if (await configFile.exists()) {
          await configFile.delete();
        }
      }
    }

    // Run dart fix to clean up any remaining unused imports
    // Note: l10n-specific imports are already removed in resolve_l10n_keys_ref_in_codebase.dart
    print('Running dart fix to clean up any remaining unused imports...');
    final result = await runBabelProcess(
      command: 'dart fix --apply .',
      dirrPath: payload.directoryPath,
    );

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return GenerateFlowRemovedUnnecessaryArbConfigFiles(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
      runForAllFiles: payload.runForAllFiles,
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
