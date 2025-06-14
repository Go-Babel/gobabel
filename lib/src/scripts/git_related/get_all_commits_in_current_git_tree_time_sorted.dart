import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';

class GetAllCommitsInCurrentGitTreeOrdoredByTime {
  Future<List<ShaCommit>> call() async {
    // Replace this with the path to your Git repository
    final repoPath = Dependencies.targetDirectory.path;

    // Check if the directory is a Git repository
    final gitDir = Directory('$repoPath/.git');
    if (!gitDir.existsSync()) {
      throw Exception('This is not a Git repository.');
    }

    // git log --reverse --pretty=format:%H --date=short
    // Run git log command to get commits from oldest to newest
    final result = await BabelProcessRunner.run(
      'git log --reverse --pretty=format:"%H" --date=short',
    );

    if (result.exitCode != 0) {
      throw Exception(
        'Error while trying to run git command "git log --reverse --pretty=format:%H --date=short".\n${result.stderr}.',
      );
    }

    // Print the list of commits
    final output = result.stdout as String;
    final allShas = output.split('\n');
    return allShas;
  }
}
