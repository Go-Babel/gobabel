import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';

class DartFixFormatUsecase {
  Future<void> call() async {
    final bool isFromZero =
        await Dependencies.filesVerificationState?.map(
          fromLastCommit: (value) => false,
          fromZero: (value) => true,
        ) ??
        false;
    if (isFromZero) {
      await BabelProcessRunner.run('dart fix --apply');
      await BabelProcessRunner.run('dart format .');
      return;
    }
    final List<File> files = await Dependencies.filesToBeAnalysed;
    if (files.isEmpty) return;

    final Iterable<String> paths = files.map((e) => e.path);

    await BabelProcessRunner.run('dart format $paths');
    for (final String path in paths) {
      await BabelProcessRunner.run('dart fix --apply $path');
    }
  }
}
