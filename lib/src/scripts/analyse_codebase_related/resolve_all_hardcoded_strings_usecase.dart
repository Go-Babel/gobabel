import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/gobabel_controller.dart';
import 'package:gobabel/src/scripts/other/add_import_if_needed.dart';
import 'package:console_bars/console_bars.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/gobabel_labels_extractor.dart';

class ResolveAllHardcodedStringsUsecase {
  final AddImportIfNeededUsecase _addImportIfNeededUsecase;
  final GobabelStringExtractorController _getHarcodedStringsUsecase;

  const ResolveAllHardcodedStringsUsecase({
    required AddImportIfNeededUsecase addImportIfNeededUsecase,
    required GobabelStringExtractorController getHarcodedStringsUsecase,
  }) : _getHarcodedStringsUsecase = getHarcodedStringsUsecase,
       _addImportIfNeededUsecase = addImportIfNeededUsecase;

  Future<void> call({
    required String projectApiToken,
    bool generateLogs = false,
  }) async {
    final projectShaIdentifier = Dependencies.gitVariables.projectShaIdentifier;

    final List<File> files = await Dependencies.filesToBeAnalysed;

    final result = await _getHarcodedStringsUsecase.extractAndProcessStrings(
      files: files,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
      generateLogs: generateLogs,
    );

    final FillingBar? p =
        isInTest
            ? null
            : FillingBar(
              desc: 'Replacing hardcoded strings...',
              total: result.length,
              time: true,
              percentage: true,
            );

    for (final entry in result) {
      p?.increment();
      final FilePath key = entry.key;
      final List<BabelLabelEntityRootLabel> value = entry.value;
      final File file = File(key);
      String fileContent = await file.readAsString();

      fileContent = _addImportIfNeededUsecase.call(fileContent: fileContent);

      Dependencies.newLabelsKeys.addAll({
        for (final BabelLabelEntityRootLabel label in value)
          label.l10nKey: label.l10nValue,
      });

      // Replace the hardcoded strings with the Babel function implementation
      for (final BabelLabelEntityRootLabel label in value) {
        final String newText = label.babelFunctionImplementation;
        final int fileStartIndex = label.fileStartIndex;
        final int fileEndIndex = label.fileEndIndex;

        fileContent = fileContent.replaceRange(
          fileStartIndex,
          fileEndIndex,
          newText,
        );
        Dependencies.addLabelContextPath(label.l10nKey, file.path);
      }
    }
  }
}
