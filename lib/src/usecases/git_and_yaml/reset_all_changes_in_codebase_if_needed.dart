import 'dart:io';

import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:result_dart/result_dart.dart';

// Run commands to reset all changes including untracked files
AsyncResult<Unit> resetAllChangesInCodebaseIfNeeded({
  required Directory directory,
}) async {
  final resetResultAsync = await runBabelProcess(
    command: 'git reset --hard HEAD',
    dirrPath: directory.path,
  );
  
  if (resetResultAsync.isError()) {
    return Failure(resetResultAsync.exceptionOrNull()!);
  }
  
  final cleanResultAsync = await runBabelProcess(
    command: 'git clean -fd',
    dirrPath: directory.path,
  );
  
  if (cleanResultAsync.isError()) {
    return Failure(cleanResultAsync.exceptionOrNull()!);
  }
  
  return Success(unit);
}
