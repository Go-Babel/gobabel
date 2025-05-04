import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';

class SetChangedDartFilesBetweenCommitsUsecase {
  /// Returns a list of file paths that were changed between [commit1] and [commit2].
  ///
  /// The function executes a Git command to identify files that were modified, added,
  /// or deleted between the two specified commits. It assumes the command is run
  /// from within a Git repository.
  ///
  /// - [commit1]: The SHA of the first Git commit.
  /// - [commit2]: The SHA of the second Git commit.
  ///
  /// Returns a `Future` containing a list of file paths as strings.
  ///
  /// Throws an `Exception` if the Git command fails (e.g., invalid commits, Git not
  /// installed, or not in a Git repository).
  Future<void> call({required String commit1, required String commit2}) async {
    Dependencies.gitBarLoading.increment();
    final dirrPath = Dependencies.targetDirectory.path;
    // Run the Git diff command with --name-only to get changed file paths
    final result = await Process.run('git', [
      'diff',
      '--name-only',
      commit1,
      commit2,
    ], workingDirectory: dirrPath);

    // Check if the command executed successfully
    if (result.exitCode != 0) {
      throw Exception('Git command failed: ${result.stderr}');
    }

    // Convert the output to a string and split it into a list of file paths
    final output = result.stdout as String;
    final files =
        output
            .split('\n') // Split by newline to get individual paths
            .map((line) => line.trim()) // Trim whitespace from each path
            .where(
              (line) =>
                  // Remove empty lines
                  line.isNotEmpty &&
                  // Filter for Dart files
                  line.endsWith('.dart'),
            )
            .toList()
            .toSet();

    Dependencies.changedPaths.addAll(files);
  }
}
