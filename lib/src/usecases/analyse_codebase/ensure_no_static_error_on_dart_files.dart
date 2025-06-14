import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
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
      return Exception(
        'Static analysis failed for directory ${directoryPath.pink}.\n'
        'Error in ${fullOutput.pink}.\n'
        'Please check the output above for details.',
      ).toFailure();
    }

    return unit.toSuccess();
  } catch (e, s) {
    return Exception(
      'An error occurred while running static analysis: $e\n$s',
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
      referenceArbMap: payload.referenceArbMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      accountApiKey: payload.accountApiKey,
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
