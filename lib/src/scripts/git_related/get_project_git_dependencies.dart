import 'dart:async';
import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';

void main() {
  final getProjectGitDependenciesUsecase = GetProjectGitDependenciesUsecase();
  getProjectGitDependenciesUsecase();
}

class GetProjectGitDependenciesUsecase {
  Future<void> call() async {
    // Use the appropriate shell based on the platform
    String shell = Platform.isWindows ? 'cmd' : 'sh';
    List<String> shellArgs;

    if (Platform.isWindows) {
      // Windows doesn't have 'head' natively; assuming Git Bash or WSL
      shellArgs = ['/c', 'git rev-list --parents --reverse HEAD | head -2'];
    } else {
      // Unix-like systems (Linux, macOS)
      shellArgs = ['-c', 'git rev-list --parents --reverse HEAD | head -2'];
    }

    // Run the command
    final ProcessResult result = await Process.run(shell, shellArgs);
    Dependencies.gitVariables = GitVariables(
      projectShaIdentifier: '${result.stdout}'
          .split('\n')[1]
          .trim()
          .replaceAll(' ', '-'),
    );
    // Display the output
    // print('Standard Output complete:');
    // print(result.stdout);
    // print('Standard Output target:');
    // print('${result.stdout}'.split('\n')[1]);

    // if (result.stderr.isNotEmpty) {
    //   print('Standard Error:');
    //   print(result.stderr);
    // }

    // print('Exit Code: ${result.exitCode}');
  }
}

class GitVariables {
  final String projectShaIdentifier;

  const GitVariables({required this.projectShaIdentifier});
}
