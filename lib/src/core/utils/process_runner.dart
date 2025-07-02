import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<ProcessResult> runBabelProcess({
  required String command,
  required String dirrPath,
}) async {
  try {
    // Use the appropriate shell based on the platform
    String shell = Platform.isWindows ? 'cmd' : 'sh';
    List<String> shellArgs;

    if (Platform.isWindows) {
      // Windows doesn't have 'head' natively; assuming Git Bash or WSL
      shellArgs = ['/c', command];
    } else {
      // Unix-like systems (Linux, macOS)
      shellArgs = ['-c', command];
    }

    // Run the command
    final processResult = await Process.run(
      shell,
      shellArgs,
      workingDirectory: dirrPath,
    );

    return Success(processResult);
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Process execution failed',
        description:
            'Failed to execute command "$command" in directory "$dirrPath"',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}
