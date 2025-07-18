import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> generateLogIfNeeded(
  Map<String, dynamic> value,
  Directory directory,
) async {
  try {
    await saveStringData(
      dirr: directory,
      data: value,
      fileName: 'gobabel_log.json',
    );
    return Success(unit);
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to generate log file',
        description: 'An error occurred while trying to save the log file.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

extension MakeExt<T extends FlowInterface<T>, F extends Object>
    on AsyncBabelResult<T> {
  AsyncBabelResult<T> get log_if_needed async {
    return foldAsync(
      (value) async {
        // Display success message based on flow type
        final String endText =
            '${'Refresh '.aquamarine} gobabel dashboard to see changes.'.green;

        final String successMessage;
        if (value is CreateFlowState) {
          successMessage =
              'Project created in GOBABEL SYSTEM successfully!\n$endText'.green;
        } else if (value is SyncFlowState) {
          successMessage =
              'Project synced with GOBABEL SYSTEM successfully!\n$endText'
                  .green;
        } else if (value is GenerateFlowState) {
          successMessage = 'New version created successfully!\n$endText'.green;
        } else {
          successMessage = 'Operation completed successfully!\n$endText'.green;
        }

        LoadingIndicator.instance.displaySuccess(successMessage);

        final bool shouldReset = value.shouldReset;
        if (!shouldReset) return value.toSuccess();
        final resetResponse = await generateLogIfNeeded(
          value.toJson(),
          value.directory,
        );
        if (resetResponse.isError()) {}

        return value.toSuccess();
      },
      (BabelFailureResponse error) async {
        final bool shouldReset = lastCorrectState.shouldReset;
        if (!shouldReset) return error.toFailure();
        lastCorrectState.toJson();

        final resetResponse = await generateLogIfNeeded(
          lastCorrectState.toJson(),
          lastCorrectState.directory,
        );
        if (resetResponse.isError()) {}

        return error.toFailure();
      },
    );
  }
}
