import 'dart:io';

import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:result_dart/result_dart.dart';

// Run commands to reset all changes including untracked files
AsyncResult<Unit> resetAllChangesInCodebaseIfNeeded({
  required Directory directory,
}) async {
  await BabelProcessRunner.run(
    command: 'git reset --hard HEAD',
    dirrPath: directory.path,
  );
  await BabelProcessRunner.run(
    command: 'git clean -fd',
    dirrPath: directory.path,
  );
  return Success(unit);
}
