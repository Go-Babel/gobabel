import 'dart:io';

import 'package:gobabel_client/gobabel_client.dart';

class GetLastLocalCommitInCurrentBranchUsecase {
  Future<GitCommit> call() async {
    // Use a custom log format to make parsing easier
    const format = '%H|%an|%ae|%ad|%s';

    final result = await Process.run('git', [
      'log',
      '-1',
      '--pretty=format:$format',
      '--date=iso',
    ]);

    if (result.exitCode != 0) {
      throw Exception('Failed to get last commit: ${result.stderr}');
    }

    final output = result.stdout.toString().trim();
    final parts = output.split('|');

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
