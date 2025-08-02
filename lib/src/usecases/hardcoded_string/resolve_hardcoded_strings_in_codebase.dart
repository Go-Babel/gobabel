import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/extract_hardcode_string/babel_label_entity.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/add_import_if_needed.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> resolveHardcodedStringsInCodebase({
  required List<File> targetFiles,
  required CodeBaseYamlInfo codeBaseYamlInfo,
  required Map<FilePath, List<BabelLabelEntityRootLabel>> allHardcodedStrings,
}) async {
  try {
    // ignore: prefer_function_declarations_over_variables
    final AsyncBabelResult<Unit> Function() processFunction = () async {
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
        return BabelFailureResponse.onlyBabelException(
          exception: BabelException(
            title: 'No files modified',
            description:
                'Failed to modify any files. This could be due to: '
                '1) All target files had processing errors, '
                '2) No hardcoded strings were found to replace, or '
                '3) File permission issues. '
                'Please check the console output for specific file errors.',
          ),
        ).toFailure();
      }

      return Success(unit);
    };

    final result = await processFunction();
    return result;
  } catch (error, stackTrace) {
    if (error is BabelException) {
      return BabelFailureResponse.withErrorAndStackTrace(
        exception: error,
        error:
            'An error occurred while resolving hardcoded strings in the codebase.',
        stackTrace: stackTrace,
      ).toFailure();
    }
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Unexpected error',
        description: 'An unexpected error occurred.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

AsyncBabelResult<GenerateFlowReplacedHardcodedStringsForBabelText>
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
        dangerouslyAutoDetectUserFacingHardcodedStrings:
            payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
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
    });
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'String replacement failed',
        description:
            'Failed to replace hardcoded strings in the codebase:\n'
            'This might be due to file access issues or invalid replacement patterns.\n'
            'Please ensure all files are writable and try again.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}
