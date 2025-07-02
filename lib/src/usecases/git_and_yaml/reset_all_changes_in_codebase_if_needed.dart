import 'dart:io';

import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
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

extension MakeExt<F extends Object> on AsyncResult<GenerateFlowState> {
  AsyncResult<GenerateFlowState> get generate_resetIfError async {
    if (await isError()) {
      final bool shouldReset = lastCorrectState.shouldReset;
      if (!shouldReset) return this;

      final resetResponse = await resetAllChangesInCodebaseIfNeeded(
        directory: lastCorrectState.directory,
      );

      if (resetResponse.isError()) {
        final exception = resetResponse.exceptionOrNull()!;
        return Failure(exception);
      }
    }

    return this;
  }
}
