import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';

class DartFixFormatUsecase {
  Future<void> call() async {
    final List<File> files = await Dependencies.filesToBeAnalysed;
    if (files.isEmpty) return;

    final String paths = files.map((e) => '"${e.path}"').join(' ');

    await BabelProcessRunner.run('dart fix --apply $paths');
    await BabelProcessRunner.run('dart format $paths');
  }
}
