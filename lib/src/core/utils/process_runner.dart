import 'dart:io';

import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<ProcessResult> runBabelProcess({
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
  } catch (e) {
    return BabelException(
      title: 'Process execution failed',
      description: 'Failed to execute command "$command" in directory "$dirrPath". Error: ${e.toString()}',
    ).toFailure();
  }
}
