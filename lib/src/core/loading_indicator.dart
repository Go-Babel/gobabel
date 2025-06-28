import 'dart:async';
import 'dart:io';

import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:result_dart/result_dart.dart';

class LoadingIndicator {
  static LoadingIndicator? _instance;
  LoadingIndicator._();
  static LoadingIndicator get instance =>
      (_instance ??= LoadingIndicator._()).._stopwatch.start();

  final Stopwatch _stopwatch = Stopwatch();
  static const List<String> _spinnerChars = ['|', '/', '-', '\\'];
  static const Duration _interval = Duration(milliseconds: 120);
  int _idx = 0;
  Timer? _timer;

  void set({
    required String message,
    required int totalCount,
    required int step,
    bool enabled = true,
  }) {
    // Cancel any existing timer first
    _timer?.cancel();

    // Skip if logging is disabled
    if (!enabled) return;

    // final String message = loadingMessage.message;
    // final int step = loadingMessage.step;

    // Start a periodic timer to update the spinner
    _timer = Timer.periodic(_interval, (_) {
      final seconds = (_stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(
        1,
      );
      final spinnerChar = _spinnerChars[_idx % _spinnerChars.length];
      stdout
        ..write(' ' * (message.length + 15))
        ..write('\r[ ($step/$totalCount) ${seconds}s ] $spinnerChar $message');

      _idx++;
    });
  }

  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
  }
}

late IFlowInterface lastCorrectState;

extension AsyncResultDartExtension<F extends Object> //
    on AsyncResultDart<IFlowInterface, F> {
  AsyncResultDart<IFlowInterface, F> successErrorFlatMap(
    FutureOr<ResultDart<IFlowInterface, F>> Function(IFlowInterface success)
    successFlatMap,
    FutureOr<ResultDart<IFlowInterface, F>> Function(F error) errorFlatMap,
  ) {
    return then((result) => result.fold(successFlatMap, errorFlatMap));
  }

  AsyncResultDart<IFlowInterface, F> toNextStep(
    FutureOr<ResultDart<IFlowInterface, F>> Function(IFlowInterface success) fn,
  ) {
    return successErrorFlatMap(
      (success) {
        lastCorrectState = success;
        // Check if this is a state with willLog property
        bool shouldLog = true;
        try {
          // Use dynamic to check if willLog exists
          final dynamic state = success;
          if (state != null && state.willLog != null) {
            shouldLog = state.willLog as bool;
          }
        } catch (_) {
          // If willLog doesn't exist, default to true
        }

        LoadingIndicator.instance.set(
          message: success.message,
          step: success.stepCount,
          totalCount: success.maxAmountOfSteps,
          enabled: shouldLog,
        );
        return fn(success);
      },
      (error) {
        return Failure(error);
      },
    );
  }
}
