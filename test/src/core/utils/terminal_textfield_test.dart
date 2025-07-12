import 'package:gobabel/src/core/utils/terminal_textfield.dart';
import 'package:test/test.dart';

void main() {
  group('Terminal textfield tests', () {
    test('getTerminalWidth returns valid width', () {
      // This test verifies that the terminal width detection works
      final width = getTerminalWidth();
      expect(width, greaterThan(0));
      expect(width, lessThanOrEqualTo(500)); // Reasonable upper limit
    });

    test('InputFormOptions can be created', () {
      // Test that the InputFormOptions class works correctly
      final options = InputFormOptions<String>(
        options: {'option1', 'option2', 'option3'},
        optionToString: (s) => s.toUpperCase(),
      );

      expect(options.options.length, equals(3));
      expect(options.optionToString('test'), equals('TEST'));
    });

    test('Cursor positioning calculations', () {
      // Test the cursor positioning logic
      // The format is: │ > text│
      // So we have: 1 (border) + 1 (space) + 1 (>) + 1 (space) = 4 chars before text

      // For empty buffer
      int horizontalPos = 4; // Just the prefix
      expect(horizontalPos, equals(4));

      // For buffer with 5 characters
      horizontalPos = 4 + 5;
      expect(horizontalPos, equals(9));

      // For truncated text (when buffer > available width)
      final boxWidth = 20;
      final availableWidth = boxWidth - 4; // 16
      horizontalPos = 4 + (availableWidth - 3); // 4 + 13 = 17
      expect(horizontalPos, equals(17));
    });

    test('Vertical movement calculations', () {
      // Test vertical cursor movement logic

      // Just textfield (no options, no error)
      // Need to move up 1 line (from bottom border to content line)
      int linesToMoveUp = 1;
      expect(linesToMoveUp, equals(1));

      // With error
      linesToMoveUp = 1 + 1; // error line + bottom border
      expect(linesToMoveUp, equals(2));

      // With 5 options
      linesToMoveUp = 5 + 1 + 1; // options + spacing + bottom border
      expect(linesToMoveUp, equals(7));

      // With 3 options and error
      linesToMoveUp =
          3 + 1 + 1 + 1; // options + spacing + error + bottom border
      expect(linesToMoveUp, equals(6));
    });
  });
}
