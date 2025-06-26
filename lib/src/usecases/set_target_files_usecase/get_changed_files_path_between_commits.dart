import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Set<FilePath>> getChangedFilesPathBetweenCommits({
  required String dirrPath,
  required String commit1,
  required String commit2,
}) async {
  final resultAsync = await runBabelProcess(
    command: 'git diff --name-only $commit1 $commit2',
    dirrPath: dirrPath,
  );

  return resultAsync.fold(
    (result) {
      // Check if the command executed successfully
      if (result.exitCode != 0) {
        return BabelException(
          title: 'Git diff command failed',
          description: 'Failed to get changed files between commits $commit1 and $commit2.\nGit error: ${result.stderr}\n\nPlease ensure both commits exist in the repository.',
        ).toFailure();
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
                    line.endsWith('.dart') &&
                    !line.contains('test/') &&
                    line.contains('lib/') &&
                    !line.contains('.g.dart') &&
                    !line.contains('.freezed.dart') &&
                    !line.contains('.gen.dart'),
              )
              .toList()
              .toSet();

      return files.toSuccess();
    },
    (failure) => Failure(failure),
  );
}
