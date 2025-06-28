import 'package:gobabel/src/usecases/codebase_analyse_related/remove_adjacent_string_concatenation.dart';
import 'package:test/test.dart';

void main() {
  group('RemoveAdjacentStringLiteralConcatenationUsecase', () {
    group('Basic string concatenation', () {
      test('should combine two adjacent double-quoted strings', () {
        // const input = "final example = 'Hello ' 'world!';";
        // const expected = "Text('Hello world!')";
        const input = "final text = Text('Hello ' 'world!');";
        const expected = "final text = Text('Hello world!');";

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(expected));
      });

      test('should combine multiple adjacent strings', () {
        const input = "final text = Text('Hello ' 'beautiful ' 'world!');";
        const expected = "final text = Text('Hello beautiful world!');";

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(expected));
      });

      test('should handle single-quoted strings', () {
        const input = 'final example = Text("Hello " "world!");';
        const expected = 'final example = Text("Hello world!");';

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(expected));
      });
    });

    group('Multiple concatenations in same code', () {
      test('should handle multiple separate concatenations', () {
        const input = '''
void main() {
  print('Hello ' 'world!');
  final msg = 'Good ' 'morning!';
}''';
        const expected = '''
void main() {
  print('Hello world!');
  final msg = 'Good morning!';
}''';

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(expected));
      });
    });

    group('Edge cases', () {
      test('should return original source when no adjacent strings exist', () {
        const input = "Text('Hello world!')";

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(input));
      });

      test('should return original source when there are parse errors', () {
        const input = "Text('Hello ' 'world!' // unclosed bracket";

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(input));
      });

      test('should handle multiline adjacent strings', () {
        const input = '''final example = Text('Line 1\\n'
    'Line 2\\n'
    'Line 3');''';
        const expected =
            '''final example = Text('Line 1\\nLine 2\\nLine 3');''';

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(expected));
      });

      test('should preserve escape sequences in multiline strings', () {
        const input = '''final example = Tooltip(
                            message:
                                'You need to finish the onboarding flow first\\n'
                                'Snyc the project labels to GoBabel system',
);''';
        const expected = '''final example = Tooltip(
                            message:
                                'You need to finish the onboarding flow first\\nSnyc the project labels to GoBabel system',
);''';

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        print(result);
        expect(result, equals(expected));
      });
    });

    group('Real-world scenarios', () {
      test('should handle Flutter widget with long text', () {
        const input = '''
Widget build(BuildContext context) {
  return Text(
    'This is a very long text that spans ' 
    'multiple lines and should be ' 
    'concatenated into a single string'
  );
}''';
        const expected = '''
Widget build(BuildContext context) {
  return Text(
    'This is a very long text that spans multiple lines and should be concatenated into a single string'
  );
}''';

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(expected));
      });

      test('should handle SQL query strings', () {
        const input = '''
final query = 'SELECT * FROM users '
              'WHERE age > 18 '
              'AND status = "active"';''';
        const expected = '''
final query = 'SELECT * FROM users WHERE age > 18 AND status = "active"';''';

        final result = singleRemoveAdjacentStringLiteralConcatenationUsecase(
          input,
        );
        expect(result, equals(expected));
      });
    });
  });
}
