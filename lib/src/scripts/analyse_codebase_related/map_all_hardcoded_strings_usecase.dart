import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/gobabel_labels_extractor.dart';

class MapAllHardcodedStringsUsecase {
  final GobabelStringExtractorController _getHarcodedStringsUsecase;

  const MapAllHardcodedStringsUsecase({
    required GobabelStringExtractorController getHarcodedStringsUsecase,
  }) : _getHarcodedStringsUsecase = getHarcodedStringsUsecase;

  Future<void> call({required String projectApiToken}) async {
    final projectShaIdentifier = Dependencies.gitVariables.projectShaIdentifier;
    final List<File> files = await Dependencies.filesVerificationState!.map(
      fromLastCommit: (value) async {
        final List<File> changedFiles = [];
        for (final filePath in value.changedFilesPath) {
          final file = File(filePath);
          if (await file.exists()) {
            changedFiles.add(file);
          }
        }

        return changedFiles;
      },
      fromZero:
          (value) async => await getEligibleFiles(Dependencies.targetDirectory),
    );

    final result = await _getHarcodedStringsUsecase.extractAndProcessStrings(
      files: files,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
    );

    for (final entry in result) {
      final FilePath key = entry.key;
      final List<BabelLabelEntityRootLabel> value = entry.value;
      final File file = File(key);
      String fileContent = await file.readAsString();

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
