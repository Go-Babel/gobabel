import 'dart:async';

import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:test/test.dart';

void main() {
  group('LoadingIndicator', () {
    setUp(() {
      // Ensure clean state for each test
      LoadingIndicator.resetForTesting();
    });

    tearDown(() {
      // Clean up after each test
      LoadingIndicator.instance.dispose();
      LoadingIndicator.resetForTesting();
    });

    group('BarProgressInfo', () {
      test('should create with all required fields', () {
        final barInfo = BarProgressInfo(
          message: 'Processing...',
          totalSteps: 100,
          currentStep: 50,
        );

        expect(barInfo.message, equals('Processing...'));
        expect(barInfo.totalSteps, equals(100));
        expect(barInfo.currentStep, equals(50));
      });
    });

    group('singleton behavior', () {
      test('should return same instance', () {
        final instance1 = LoadingIndicator.instance;
        final instance2 = LoadingIndicator.instance;

        expect(identical(instance1, instance2), isTrue);
      });

      test('should create new instance after reset', () {
        final instance1 = LoadingIndicator.instance;

        LoadingIndicator.resetForTesting();

        final instance2 = LoadingIndicator.instance;

        expect(identical(instance1, instance2), isFalse);
      });
    });

    group('setLoadingState', () {
      test('should handle basic loading state', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Loading data',
            totalCount: 10,
            step: 3,
            barProgressInfo: null,
          );
        }, returnsNormally);
      });

      test('should handle loading state with progress bar', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Main task',
            totalCount: 5,
            step: 2,
            barProgressInfo: BarProgressInfo(
              message: 'Sub task progress',
              totalSteps: 100,
              currentStep: 25,
            ),
          );
        }, returnsNormally);
      });

      test('should handle multiple calls in sequence', () {
        expect(() {
          for (int i = 1; i <= 5; i++) {
            LoadingIndicator.instance.setLoadingState(
              message: 'Step $i',
              totalCount: 5,
              step: i,
              barProgressInfo: null,
            );
          }
        }, returnsNormally);
      });
    });

    group('progress bar edge cases', () {
      test('should handle zero progress', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Test',
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: 'Progress at 0%',
              totalSteps: 100,
              currentStep: 0,
            ),
          );
        }, returnsNormally);
      });

      test('should handle 100% progress', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Test',
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: 'Progress at 100%',
              totalSteps: 100,
              currentStep: 100,
            ),
          );
        }, returnsNormally);
      });

      test('should handle current > total', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Test',
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: 'Progress overflow',
              totalSteps: 50,
              currentStep: 75, // More than total
            ),
          );
        }, returnsNormally);
      });

      test('should handle zero total steps', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Test',
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: 'Zero total',
              totalSteps: 0, // Zero total
              currentStep: 10,
            ),
          );
        }, returnsNormally);
      });

      test('should handle negative values', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Test',
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: 'Negative',
              totalSteps: 100,
              currentStep: -50,
            ),
          );
        }, returnsNormally);
      });
    });

    group('switching between modes', () {
      test('should switch from single line to multi-line', () {
        expect(() {
          // Start with no progress bar
          LoadingIndicator.instance.setLoadingState(
            message: 'Single line',
            totalCount: 1,
            step: 1,
            barProgressInfo: null,
          );

          // Switch to progress bar
          LoadingIndicator.instance.setLoadingState(
            message: 'Multi line',
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: 'Progress',
              totalSteps: 100,
              currentStep: 50,
            ),
          );
        }, returnsNormally);
      });

      test('should switch from multi-line to single line', () {
        expect(() {
          // Start with progress bar
          LoadingIndicator.instance.setLoadingState(
            message: 'Multi line',
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: 'Progress',
              totalSteps: 100,
              currentStep: 50,
            ),
          );

          // Switch to no progress bar
          LoadingIndicator.instance.setLoadingState(
            message: 'Single line',
            totalCount: 1,
            step: 1,
            barProgressInfo: null,
          );
        }, returnsNormally);
      });
    });

    group('displayError', () {
      test('should handle error display after loading', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Processing',
            totalCount: 1,
            step: 1,
            barProgressInfo: null,
          );

          LoadingIndicator.instance.displayError();
        }, returnsNormally);
      });

      test('should handle error display without prior loading', () {
        expect(() {
          LoadingIndicator.instance.displayError();
        }, returnsNormally);
      });
    });

    group('dispose', () {
      test('should handle dispose after loading', () {
        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: 'Test',
            totalCount: 1,
            step: 1,
            barProgressInfo: null,
          );

          LoadingIndicator.instance.dispose();
        }, returnsNormally);
      });

      test('should handle dispose without loading', () {
        expect(() {
          LoadingIndicator.instance.dispose();
        }, returnsNormally);
      });

      test('should handle multiple dispose calls', () {
        expect(() {
          LoadingIndicator.instance.dispose();
          LoadingIndicator.instance.dispose();
        }, returnsNormally);
      });
    });

    group('integration scenarios', () {
      test('should handle rapid state changes', () async {
        expect(() async {
          for (int i = 0; i < 10; i++) {
            LoadingIndicator.instance.setLoadingState(
              message: 'Rapid change $i',
              totalCount: 10,
              step: i + 1,
              barProgressInfo:
                  i % 2 == 0
                      ? BarProgressInfo(
                        message: 'Even progress',
                        totalSteps: 10,
                        currentStep: i + 1,
                      )
                      : null,
            );
            await Future.delayed(Duration(milliseconds: 10));
          }
        }, returnsNormally);
      });

      test('should handle very long messages', () {
        final longMessage = 'A' * 200;

        expect(() {
          LoadingIndicator.instance.setLoadingState(
            message: longMessage,
            totalCount: 1,
            step: 1,
            barProgressInfo: BarProgressInfo(
              message: longMessage,
              totalSteps: 100,
              currentStep: 50,
            ),
          );
        }, returnsNormally);
      });

      test('should handle extreme progress values', () {
        expect(() {
          // Very large values
          LoadingIndicator.instance.setLoadingState(
            message: 'Test',
            totalCount: 1000000,
            step: 500000,
            barProgressInfo: BarProgressInfo(
              message: 'Large',
              totalSteps: 1000000,
              currentStep: 500000,
            ),
          );
        }, returnsNormally);
      });

      test('should handle complete workflow', () async {
        expect(() async {
          // Simulate a complete workflow
          final steps = [
            'Initializing...',
            'Loading data...',
            'Processing...',
            'Finalizing...',
            'Complete!',
          ];

          for (int i = 0; i < steps.length; i++) {
            LoadingIndicator.instance.setLoadingState(
              message: steps[i],
              totalCount: steps.length,
              step: i + 1,
              barProgressInfo:
                  i > 1 && i < 4
                      ? BarProgressInfo(
                        message: 'Processing batch ${i - 1}',
                        totalSteps: 100,
                        currentStep: (i - 1) * 33,
                      )
                      : null,
            );
            await Future.delayed(Duration(milliseconds: 50));
          }

          LoadingIndicator.instance.dispose();
        }, returnsNormally);
      });
    });

    group('clean function behavior', () {
      test('should handle cleaning when switching line counts', () {
        expect(() {
          // Test multiple switches to ensure clean function works correctly
          for (int i = 0; i < 5; i++) {
            // Multi-line with progress bar
            LoadingIndicator.instance.setLoadingState(
              message: 'With bar $i',
              totalCount: 5,
              step: i + 1,
              barProgressInfo: BarProgressInfo(
                message: 'Progress $i',
                totalSteps: 100,
                currentStep: i * 20,
              ),
            );

            // Single line without progress bar
            LoadingIndicator.instance.setLoadingState(
              message: 'Without bar $i',
              totalCount: 5,
              step: i + 1,
              barProgressInfo: null,
            );
          }
        }, returnsNormally);
      });
    });
  });
}
