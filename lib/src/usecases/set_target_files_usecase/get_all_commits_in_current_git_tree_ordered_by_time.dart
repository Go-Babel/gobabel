import 'dart:io';

import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<List<ShaCommit>> getAllCommitsInCurrentGitTreeOrderedByTime({
  required String directoryPath,
}) async {
  try {
    // Check if the directory is a Git repository
    final gitDir = Directory('$directoryPath/.git');
    if (!await gitDir.exists()) {
      return Failure(
        BabelException(
          title: 'Not a Git repository',
          description:
              'The directory at $directoryPath is not a Git repository.',
        ),
      );
    }

    // Run git log command to get commits from oldest to newest
    final resultAsync = await runBabelProcess(
      command: 'git log --reverse --pretty=format:"%H" --date=short',
      dirrPath: directoryPath,
    );

    return resultAsync.fold(
      (result) {
        if (result.exitCode != 0) {
          return Failure(
            BabelException(
              title: 'Git log command failed',
              description:
                  'Error while trying to run git command "git log --reverse --pretty=format:%H --date=short".\\n${result.stderr}',
            ),
          );
        }

        // Print the list of commits
        final output = result.stdout as String;
        final allShas = output.split('\\n').where((s) => s.isNotEmpty).toList();
        return Success(allShas);
      },
      (failure) => Failure(failure),
    );
  } catch (e, s) {
    return Failure(
      BabelException(
        title: 'Failed to get all commits in current git tree ordered by time',
        description: 'An unexpected error occurred: $e\\n$s',
      ),
    );
  }
}
