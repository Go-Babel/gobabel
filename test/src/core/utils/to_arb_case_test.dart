import 'package:gobabel/src/core/utils/to_arb_case.dart';
import 'package:test/test.dart';

void main() {
  group('transformSpecialCharsIfNeeded', () {
    test('should add a "d" prefix to strings that start with a digit', () {
      expect('123abc'.transformSpecialCharsIfNeeded, equals('d123abc'));
      expect('1test'.transformSpecialCharsIfNeeded, equals('d1test'));
      expect('0_zero'.transformSpecialCharsIfNeeded, equals('d0_zero'));
    });

    test('should not modify strings without special characters', () {
      expect('normal'.transformSpecialCharsIfNeeded, equals('normal'));
      expect('camelCase'.transformSpecialCharsIfNeeded, equals('camelCase'));
      expect('PascalCase'.transformSpecialCharsIfNeeded, equals('PascalCase'));
      expect('snake_case'.transformSpecialCharsIfNeeded, equals('snake_case'));
      expect(
        'kebab123case'.transformSpecialCharsIfNeeded,
        equals('kebab123case'),
      );
    });

    test('should replace special characters with their names', () {
      // Mixed strings (special chars + alphanumeric)
      expect(
        'hello-world'.transformSpecialCharsIfNeeded,
        equals('hello-world'),
      );
      expect(
        'first:second'.transformSpecialCharsIfNeeded,
        equals('first:second'),
      );
      expect(
        'test@example'.transformSpecialCharsIfNeeded,
        equals('test@example'),
      );
    });

    test('should handle strings containing only special characters', () {
      expect('---'.transformSpecialCharsIfNeeded, equals('dash  dash  dash'));
      expect(
        '!!!'.transformSpecialCharsIfNeeded,
        equals('exclamation mark  exclamation mark  exclamation mark'),
      );
      expect(
        r'@#$'.transformSpecialCharsIfNeeded,
        equals('commercial at  number sign  dollar sign'),
      );
      expect(
        '()[]'.transformSpecialCharsIfNeeded,
        equals(
          'left parenthesis  right parenthesis  left square bracket  right square bracket',
        ),
      );
    });

    test('should handle complex mixed cases correctly', () {
      expect('-abc-'.transformSpecialCharsIfNeeded, equals('-abc-'));
      expect('!warning!'.transformSpecialCharsIfNeeded, equals('!warning!'));
      expect('[title]'.transformSpecialCharsIfNeeded, equals('[title]'));
    });

    test('should handle special characters that need escaping', () {
      expect('\\path'.transformSpecialCharsIfNeeded, equals('\\path'));
      expect('/route'.transformSpecialCharsIfNeeded, equals('/route'));
      expect('a/b/c'.transformSpecialCharsIfNeeded, equals('a/b/c'));
      expect('[item]'.transformSpecialCharsIfNeeded, equals('[item]'));
    });
  });

  // Here is all bugs that happend
  group('Group of bug fixes', () {
    test('Bug #1', () {
      print('{d} - {j}'.withoutVariables({}));
      // print('{d} - {j}'.transformSpecialCharsIfNeeded);
      // expect('{d} - {j}'.transformSpecialCharsIfNeeded, equals('dash  dash  dash'));
    });
  });
}
