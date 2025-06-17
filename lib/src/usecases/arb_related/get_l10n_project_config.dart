import 'dart:io';

import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<L10nProjectConfig> getProjectYamlConfigUsecase({
  required Directory curr,
}) async {
  final List<FileSystemEntity> currList = await curr.list().toList();
  final List<File> allFilesList = currList.whereType<File>().toList();

  L10nProjectConfig? projectConfig;

  final allYamlFiles =
      allFilesList
          .where((element) => element.path.toLowerCase().endsWith('.yaml'))
          .toList();
  if (allYamlFiles.isEmpty) {
    return L10nProjectConfig.noData().toSuccess();
  }

  void setProjectConfigIfItMatches(
    String yamlContent, {
    required String fileName,
    bool forceCorrectFile = false,
  }) {
    if (projectConfig == null) {
      String? templateArbFile;
      String? outputClass;
      String? arbDir;
      String? outputDir;

      final lines = yamlContent.split('\n');
      for (final line in lines) {
        if (line.contains(':') == false) continue;

        final items = line.split(':');
        final key = items.first.trim();
        final value = items.last.trim();
        if (key == 'template-arb-file') {
          templateArbFile = value;
        } else if (key == 'output-class') {
          outputClass = value;
        } else if (key == 'arb-dir') {
          arbDir = value;
        } else if (key == 'output-dir') {
          outputDir = value;
        }
      }

      if (forceCorrectFile ||
          templateArbFile != null ||
          outputClass != null ||
          arbDir != null ||
          outputDir != null) {
        final arbDir0 = arbDir ?? _defaultArbDir;
        projectConfig = L10nProjectConfig.withData(
          l10nFileName: fileName,
          templateArbFile: templateArbFile ?? _templateArbFile,
          arbDir: arbDir0,
          // If outputClass is not provided, the default configuration
          // of flutter gen-l10n is to use the arbDir
          outputDir: outputDir ?? arbDir0,
          outputClass: outputClass ?? 'AppLocalizations',
        );
        projectConfig = projectConfig;
      }
    }
  }

  final preMappedNamesOfLanguageConfigFiles = <String>{
    'l10n.yaml',
    'L10n.yaml',
    'i10n.yaml',
    'I10n.yaml',
  };
  final preMappedFiles =
      allYamlFiles
          .where(
            (File element) => preMappedNamesOfLanguageConfigFiles.any(
              (String element2) => element.path.endsWith(element2),
            ),
          )
          .toList();

  for (final File file in preMappedFiles) {
    final String yamlContent = await file.readAsString();
    setProjectConfigIfItMatches(
      yamlContent,
      forceCorrectFile: true,
      fileName: file.path,
    );
  }

  final otherYamlFiles =
      allYamlFiles
          .where(
            (File element) =>
                preMappedNamesOfLanguageConfigFiles.any(
                  (String element2) => element.path.endsWith(element2),
                ) ==
                false,
          )
          .toList();

  /// Loop until we find a l10n.yaml dirr
  for (final File file in otherYamlFiles) {
    final String yamlContent = await file.readAsString();
    setProjectConfigIfItMatches(yamlContent, fileName: file.path);
  }

  return projectConfig?.toSuccess() ?? L10nProjectConfig.noData().toSuccess();
}

/// All values bellow are the default "flutter gen-l10n" configurations for l10n.yaml file
const String _defaultArbDir = 'lib/l10n';
const String _templateArbFile = 'app_en.arb';

AsyncResult<GenerateFlowGotL10nProjectConfig>
generate_getProjectYamlConfigUsecase(GenerateFlowGotTargetFiles payload) async {
  final directory = payload.directory;
  final result = await getProjectYamlConfigUsecase(curr: directory);

  return result.map(
    (config) => GenerateFlowGotL10nProjectConfig(
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
      l10nProjectConfig: config,
    ),
  );
}
