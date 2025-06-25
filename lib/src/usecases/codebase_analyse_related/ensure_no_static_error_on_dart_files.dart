import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

/// Performs static analysis on the specified directory (defaults to 'lib').
///
/// Throws a [StaticAnalysisFailedException] if any errors are found.
/// Prints analysis output to the console.
AsyncResult<Unit> ensureNoStaticErrorOnDartFiles({
  required String directoryPath,
}) async {
  try {
    final processResult = await BabelProcessRunner.run(
      command: 'dart analyze $directoryPath',
      dirrPath: directoryPath,
    );

    final String stdout = processResult.stdout.toString();
    final String stderr = processResult.stderr.toString();
    final int exitCode = processResult.exitCode;

    // Combine stdout and stderr for a complete output picture,
    // as 'dart analyze' can put informational messages in stdout and errors in either.
    String fullOutput = "";
    if (stdout.trim().isNotEmpty) {
      fullOutput += "--- STDOUT ---\n$stdout\n";
    }
    if (stderr.trim().isNotEmpty) {
      // 'dart analyze' often puts actual errors here, even with exit code 0 for info/warnings
      // but for critical errors, exit code will be non-zero.
      fullOutput += "--- STDERR ---\n$stderr\n";
    }
    if (fullOutput.trim().isEmpty) {
      fullOutput = "No output from analyzer.";
    }

    if (exitCode != 0) {
      return BabelException(
        title: 'Static Analysis Failed',
        description: 'Static analysis failed for directory ${directoryPath.pink}.\n'
            'Error in ${fullOutput.pink}.\n'
            'Please check the output above for details.\n\n'
            'Common causes:\n'
            '• Syntax errors in Dart files\n'
            '• Missing dependencies in pubspec.yaml\n'
            '• Invalid import statements\n'
            '• Type mismatches or undefined variables\n\n'
            'Run "dart analyze" manually to see detailed errors.',
      ).toFailure();
    }

    return unit.toSuccess();
  } catch (e, s) {
    return BabelException(
      title: 'Static Analysis Error',
      description: 'An unexpected error occurred while running static analysis.\n\n'
          'Error details: $e\n\n'
          'Stack trace: $s\n\n'
          'This may be due to:\n'
          '• Dart SDK not properly installed\n'
          '• File system permissions issues\n'
          '• Corrupted project structure\n\n'
          'Try running "dart analyze" manually to diagnose the issue.',
    ).toFailure();
  }
}

AsyncResult<GenerateFlowEnsuredNoStaticErrorOnDartFiles>
generate_ensureNoStaticErrorOnDartFilesDefault(
  GenerateFlowResolvedProjectCacheTranslation payload,
) {
  return ensureNoStaticErrorOnDartFiles(
    directoryPath: payload.directoryPath,
  ).flatMap((_) {
    return GenerateFlowEnsuredNoStaticErrorOnDartFiles(
      willLog: payload.willLog,
      referenceArbMap: payload.referenceArbMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      downloadLink: payload.downloadLink,
      projectCacheMap: payload.projectCacheMap,
    ).toSuccess();
  });
}
