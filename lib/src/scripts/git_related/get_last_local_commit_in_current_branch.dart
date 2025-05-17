import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel_client/gobabel_client.dart';

import '../../core/utils/git_process_runner.dart';

class GetLastLocalCommitInCurrentBranchUsecase {
  Future<GitCommit> call() async {
    const String delimiter = '|||GIT_COMMIT_FIELD_DELIMITER|||';
    // Git log format specifiers:
    // %H: commit hash
    // %an: author name
    // %ae: author email
    // %aI: author date, strict ISO 8601 format (good for DateTime.parse)
    // %s: subject (first line of commit message)
    // Note: For the full commit message (subject + body), use %B. For this example, %s is simpler.
    const String gitLogFormat =
        '"%H$delimiter%an$delimiter%ae$delimiter%aI$delimiter%s"';

    final result = await BabelProcessRunner.run(
      'git log -1 --pretty=format:$gitLogFormat',
    );

    if (result.exitCode != 0) {
      print(
        '\n(exit:${result.exitCode}) ==> ${result.stdout.toString().trim()}'
            .pink,
      );
      print('\ngit log -1 --pretty=format:$gitLogFormat'.hotPink);
      throw Exception('Failed to get last commit: ${result.stderr}');
    }

    final output = result.stdout.toString().trim();
    final parts = output.split(delimiter);

    // git log -1 --pretty=format:%H|%an|%ae|%ad|%s
    // git log -1 --pretty=format:"%H$|||GIT_COMMIT_FIELD_DELIMITER|||%an$|||GIT_COMMIT_FIELD_DELIMITER|||%ae$|||GIT_COMMIT_FIELD_DELIMITER|||%aI$|||GIT_COMMIT_FIELD_DELIMITER|||%s"

    if (parts.length < 5) {
      throw Exception('⚠️ Unexpected git log output: $output');
    }

    return GitCommit(
      shaHash: parts[0],
      authorName: parts[1],
      authorEmail: parts[2],
      date: DateTime.parse(parts[3]),
      message: parts.sublist(4).join('|'), // in case the message has '|'
    );
  }
}
