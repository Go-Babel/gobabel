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
    required InferDeclarationFunctionByArbValueUsecase
    inferDeclarationFunctionByArbValueUsecase,
  }) : _getHarcodedStringsUsecase = getHarcodedStringsUsecase,
       _addImportIfNeededUsecase = addImportIfNeededUsecase;

  Future<void> call({
    required String projectApiToken,
    bool generateLogs = false,
  }) async {
    final projectShaIdentifier = Dependencies.gitVariables.projectShaIdentifier;

    final List<File> files = await Dependencies.filesToBeAnalysed;

    final extractorResponse = await _getHarcodedStringsUsecase
        .extractAndProcessStrings(
          files: files,
          projectApiToken: projectApiToken,
          projectShaIdentifier: projectShaIdentifier,
          generateLogs: generateLogs,
          projectHardcodedStringKeyCache: Dependencies.hardcodedStringKeyCache,
        );

    final result = extractorResponse.allHardcodedStrings;
    Dependencies.newAddedHardcodedStringKeyCache.addAll(
      extractorResponse.newHardcodedStringKeyCache,
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

      // Replace the hardcoded strings with the Babel function implementation
      for (final BabelLabelEntityRootLabel label in value) {
        final BabelFunctionDeclaration declarationFunction;

        Dependencies.newLabelsKeys.addAll({label.l10nKey: label.l10nValue});
        Dependencies.allDeclarationFunctions.add(
          label.babelFunctionDeclaration,
        );
        declarationFunction = label.babelFunctionDeclaration;
        Dependencies.addLabelContextPath(label.l10nKey, file.path);

        final int fileStartIndex = label.fileStartIndex;
        final int fileEndIndex = label.fileEndIndex;
        final replacement = label.babelFunctionImplementation;

        // fileContent = fileContent.replaceRange(
        //   fileStartIndex,
        //   fileEndIndex,
        //   declarationFunction,
        // );

        fileContent =
            fileContent.substring(0, fileStartIndex) +
            replacement +
            fileContent.substring(fileEndIndex);

        Dependencies.allDeclarationFunctions.add(declarationFunction);
      }
      fileContent = _addImportIfNeededUsecase.call(fileContent: fileContent);

      // Write the modified content back to the file
      await file.writeAsString(fileContent);
    }
  }
}
