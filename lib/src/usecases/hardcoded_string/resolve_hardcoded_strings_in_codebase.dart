import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/legacy_spinner_loading.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/extract_hardcode_string/babel_label_entity.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/add_import_if_needed.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> resolveHardcodedStringsInCodebase({
  required List<File> targetFiles,
  required CodeBaseYamlInfo codeBaseYamlInfo,
  required Map<FilePath, List<BabelLabelEntityRootLabel>> allHardcodedStrings,
}) async {
  return await legacyRunWithSpinner(
    successMessage: 'Replaced hardcoded strings in ${targetFiles.length} files',
    message:
        'Replacing hardcoded strings for "Babel function" in ${targetFiles.length} files...',
    () async {
      if (allHardcodedStrings.isEmpty) {
        return Success(unit);
      }
      bool didAtLeastOneFileChange = false;
      for (final entry in allHardcodedStrings.entries) {
        try {
          final FilePath key = entry.key;
          final List<BabelLabelEntityRootLabel> value = entry.value;
          final File file = File(key);
          String fileContent = await file.readAsString();

          // Replace the hardcoded strings with the Babel function implementation
          for (final BabelLabelEntityRootLabel label in value) {
            final int fileStartIndex = label.fileStartIndex;
            final int fileEndIndex = label.fileEndIndex;
            final replacement = label.babelFunctionImplementation;

            fileContent =
                fileContent.substring(0, fileStartIndex) +
                replacement +
                fileContent.substring(fileEndIndex);
          }

          fileContent = addImportIfNeededUsecase(
            fileContent: fileContent,
            codeBaseYamlInfo: codeBaseYamlInfo,
          );

          // Write the modified content back to the file
          await file.writeAsString(fileContent);
          didAtLeastOneFileChange = true;
        } catch (e) {
          print('Error processing file $entry: "$e"'.red);
        }
      }

      // If didAtLeastOneFileChange is false, it means no files were modified and all files had error
      if (!didAtLeastOneFileChange) {
        return Exception(
          'No files were modified, all files had errors or no hardcoded strings found.',
        ).toFailure();
      }

      return Success(unit);
    },
  );
}

AsyncResult<GenerateFlowReplacedHardcodedStringsForBabelText>
generate_resolveHardcodedStringsInCodebase(
  GenerateFlowResolvedHardcodedStrings payload,
) async {
  try {
    final allHardcodedStrings = payload.hardcodedStringsPerFile;
    final codeBaseYamlInfo = payload.yamlInfo;
    final targetFiles = await payload.filesToBeAnalysed;

    return resolveHardcodedStringsInCodebase(
      targetFiles: targetFiles,
      codeBaseYamlInfo: codeBaseYamlInfo,
      allHardcodedStrings: allHardcodedStrings,
    ).flatMap((_) {
      return GenerateFlowReplacedHardcodedStringsForBabelText(
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
  } catch (e) {
    return Exception(
      'Error resolving hardcoded strings in codebase: $e',
    ).toFailure();
  }
}
