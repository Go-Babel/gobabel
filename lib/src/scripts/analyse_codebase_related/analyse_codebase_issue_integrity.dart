import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';

import '../../core/utils/git_process_runner.dart';

class AnalyseCodebaseIssueIntegrityUsecase {
  /// Performs static analysis on the specified directory (defaults to 'lib').
  ///
  /// Throws a [StaticAnalysisFailedException] if any errors are found.
  /// Prints analysis output to the console.
  Future<void> call() async {
    // Check if the directory exists
    final dir = Dependencies.targetDirectory;
    final directoryPath = dir.path;

    final processResult = await BabelProcessRunner.run(
      'dart analyze $directoryPath',
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
      throw Exception(
        'Static analysis failed for directory ${directoryPath.pink}.\n'
        'Error in ${fullOutput.pink}.\n'
        'Please check the output above for details.',
      );
    }
  }
}
