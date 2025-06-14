import 'dart:io';

class BabelProcessRunner {
  static Future<ProcessResult> run({
    required String command,
    required String dirrPath,
  }) async {
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
    return await Process.run(
      shell,
      shellArgs,
      workingDirectory: dirrPath,
      // runInShell: Platform.isWindows,
    );
  }
}
