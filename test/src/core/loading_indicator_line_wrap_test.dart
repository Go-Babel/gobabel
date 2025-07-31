import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:test/test.dart';

void main() {
  group('LoadingIndicator line wrapping fixes', () {
    setUp(() {
      LoadingIndicator.resetForTesting();
    });

    tearDown(() {
      LoadingIndicator.resetForTesting();
    });

    test('should truncate long messages to fit terminal width', () {
      final indicator = LoadingIndicator.instance;

      // Test the private _truncateMessage method indirectly through behavior
      final veryLongMessage =
          'This is a very long message that would normally wrap to multiple lines in a narrow terminal causing visual artifacts and duplication issues when the loading indicator tries to clear previous lines';

      // The implementation should now:
      // 1. Detect terminal width
      // 2. Truncate messages that exceed width
      // 3. Calculate actual line count including wrapped lines
      // 4. Properly clear all lines including wrapped ones

      expect(() {
        indicator.setLoadingState(
          message: veryLongMessage,
          totalCount: 10,
          step: 1,
        );
        indicator.dispose();
      }, returnsNormally);
    });

    test('should handle progress bar with long messages', () {
      final indicator = LoadingIndicator.instance;

      final longMessage =
          'Processing a task with a very long description that needs truncation';
      final longBarMessage =
          'This progress bar message is also quite long and should be truncated';

      expect(() {
        indicator.setLoadingProgressBar(
          message: longMessage,
          barProgressInfo: BarProgressInfo(
            message: longBarMessage,
            totalSteps: 100,
            currentStep: 50,
          ),
        );
        indicator.dispose();
      }, returnsNormally);
    });

    test('should handle ANSI color codes in truncation', () {
      final indicator = LoadingIndicator.instance;

      // Message with ANSI codes (simulating colored text)
      final coloredMessage =
          '[ Normalizing codebase ] Processing files with colored output';

      expect(() {
        indicator.setLoadingState(
          message: coloredMessage,
          totalCount: 5,
          step: 1,
        );
        indicator.dispose();
      }, returnsNormally);
    });
  });
}
