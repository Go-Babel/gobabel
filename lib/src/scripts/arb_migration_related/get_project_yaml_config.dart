import 'dart:io';

class GetProjectYamlConfigUsecase {
  Future<L10nProjectConfig?> call(List<File> allFilesList) async {
    L10nProjectConfig? projectConfig;

    final allYamlFiles =
        allFilesList
            .where((element) => element.path.toLowerCase().endsWith('.yaml'))
            .toList();
    if (allYamlFiles.isEmpty) {
      return null;
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
          projectConfig = L10nProjectConfig(
            l10nFileName: fileName,
            templateArbFile: templateArbFile ?? _templateArbFile,
            arbDir: arbDir0,
            // If outputClass is not provided, the default configuration
            // of flutter gen-l10n is to use the arbDir
            outputDir: outputDir ?? arbDir0,
            outputClass: outputClass ?? 'AppLocalizations',
          );
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

    return projectConfig;
  }
}

class L10nProjectConfig {
  final String l10nFileName;
  final String templateArbFile;
  final String outputClass;
  final String outputDir;
  final String arbDir;
  const L10nProjectConfig({
    required this.templateArbFile,
    required this.outputClass,
    required this.arbDir,
    required this.outputDir,
    required this.l10nFileName,
  });
}

/// All values bellow are the default "flutter gen-l10n" configurations for l10n.yaml file
const String _defaultArbDir = 'lib/l10n';
const String _templateArbFile = 'app_en.arb';
