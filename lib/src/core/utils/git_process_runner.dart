import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';

class BabelGitProcessRunner {
  static Future<ProcessResult> run(String command) async {
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

    final dirrPath = Dependencies.targetDirectory.path;
    // Run the command
    return await Process.run(shell, shellArgs, workingDirectory: dirrPath);
  }
}
