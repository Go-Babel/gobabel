import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:result_dart/result_dart.dart';

// Run commands to reset all changes including untracked files
AsyncBabelResult<Unit> resetAllChangesInCodebaseIfNeeded({
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

extension MakeExt<F extends Object> on AsyncBabelResult<GenerateFlowState> {
  AsyncBabelResult<GenerateFlowState> get generate_resetIfError async {
    // TODOS: Remove false condition when end testing
    if (await isError() && false) {
      final bool shouldReset = lastCorrectState.shouldReset;
      if (!shouldReset) return this;

      final resetResponse = await resetAllChangesInCodebaseIfNeeded(
        directory: lastCorrectState.directory,
      );

      if (resetResponse.isError()) {
        return resetResponse.asBabelResultErrorAsync();
      }
    }

    return this;
  }
}

extension SyncResetExt on AsyncBabelResult<SyncFlowState> {
  AsyncBabelResult<SyncFlowState> get sync_resetIfError async {
    if (await isError()) {
      final bool shouldReset = lastCorrectState.shouldReset;
      if (!shouldReset) return this;

      final resetResponse = await resetAllChangesInCodebaseIfNeeded(
        directory: lastCorrectState.directory,
      );

      if (resetResponse.isError()) {
        return resetResponse.asBabelResultErrorAsync();
      }
    }

    return this;
  }
}
