import 'dart:async';
import 'dart:io';

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
  }) {
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

extension AsyncResultDartExtension<S extends Loadable, F extends Object> //
    on AsyncResultDart<S, F> {
  AsyncResultDart<W, F> toNextStep<W extends Loadable>(
    FutureOr<ResultDart<W, F>> Function(S success) fn,
  ) {
    return flatMap((success) {
      LoadingIndicator.instance.set(
        message: success.message,
        step: success.stepCount,
        totalCount: success.maxAmountOfSteps,
      );
      return fn(success);
    });
  }
}

abstract class Loadable extends Object {
  String get message;
  int get maxAmountOfSteps;
  int get stepCount;
}
