import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> generateLogIfNeeded<T extends FlowInterface<T>>(
  T value,
) async {
  try {
    await saveStringData(
      dirr: value.directory,
      data: value.toJson(),
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
    return foldAsync((value) async {
      final bool shouldReset = value.shouldReset;
      if (!shouldReset) return value.toSuccess();
      final resetResponse = await generateLogIfNeeded(value);

      if (resetResponse.isError()) {}

      return value.toSuccess();
    }, (error) => error.toFailure());
  }
}
