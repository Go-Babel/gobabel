import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

/// Performs static analysis on the specified directory.
///
/// Throws a [BabelException] if any static errors are found.
/// Warnings and info messages are allowed and will not cause failure.
AsyncBabelResult<Unit> ensureNoStaticErrorOnDartFiles({
  required String directoryPath,
}) async {
  final resultAsync = await runBabelProcess(
    command: 'dart analyze $directoryPath',
    dirrPath: directoryPath,
  );

  return resultAsync.fold((processResult) {
    final String stdout = processResult.stdout.toString();
    final String stderr = processResult.stderr.toString();

    // Combine stdout and stderr for complete output
    String fullOutput = "";
    if (stdout.trim().isNotEmpty) {
      fullOutput += stdout;
    }
    if (stderr.trim().isNotEmpty) {
      if (fullOutput.isNotEmpty) fullOutput += "\n";
      fullOutput += stderr;
    }

    // Check if there are actual errors (not just warnings or info)
    // Dart analyze output format typically shows:
    // - "error •" for errors
    // - "warning •" for warnings
    // - "info •" for info messages
    final bool hasErrors = fullOutput.contains(RegExp(r'error\s+•'));

    if (hasErrors) {
      // Extract only error lines for cleaner output
      final errorLines =
          fullOutput
              .split('\n')
              .where(
                (line) =>
                    line.contains(RegExp(r'error\s+•')) ||
                    line.contains('.dart:') &&
                        !line.contains(RegExp(r'(warning|info)\s+•')),
              )
              .toList();

      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Static Analysis Failed',
          description:
              'Static analysis found errors in directory ${directoryPath.pink}.\n'
              'Errors found:\n${errorLines.take(20).join('\n').pink}\n\n'
              'Please fix these errors before proceeding.\n\n'
              'Common causes:\n'
              '• Syntax errors in Dart files\n'
              '• Missing dependencies in pubspec.yaml\n'
              '• Invalid import statements\n'
              '• Type mismatches or undefined variables\n\n'
              'Run "dart analyze" manually to see all issues including warnings.',
        ),
      ).toFailure();
    }

    // No errors found (warnings and info messages are allowed)
    return unit.toSuccess();
  }, (failure) => Failure(failure));
}

AsyncBabelResult<GenerateFlowEnsuredNoStaticErrorOnDartFiles>
generate_ensureNoStaticErrorOnDartFilesDefault(
  GenerateFlowResolvedProjectCacheTranslation payload,
) {
  return ensureNoStaticErrorOnDartFiles(
    directoryPath: payload.directoryPath,
  ).flatMap((_) {
    return GenerateFlowEnsuredNoStaticErrorOnDartFiles(
      willLog: payload.willLog,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      projectCacheMap: payload.projectCacheMap,
    ).toSuccess();
  });
}
