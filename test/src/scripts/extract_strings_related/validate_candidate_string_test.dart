import 'package:gobabel/src/scripts/extract_strings_related/validate_candidate_string.dart';
import 'package:test/test.dart';

void main() {
  final ValidateCandidateStringUsecase validateCandidateStringUsecase =
      ValidateCandidateStringUsecase();

  group('Text Format Cases Tests', () {
    test('DotCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this.is.dot.case',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });

    test('HeaderCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'This-Is-Header-Case',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });

    test('PascalDotCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'This.Is.Pascal.Dot.Case',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });

    test('PascalCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'ThisIsPascalCase',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });

    test('ParamCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this-is-param-case',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });

    test('SnakeCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this_is_snake_case',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });

    test('PathCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this/is/path/case',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });

    test('CamelCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'thisIsCamelCase',
        last50CharsBeforeContent: '',
      );
      expect(result, isFalse);
    });
  });

  group('hasNoWords Tests', () {
    final hasNoWords = validateCandidateStringUsecase.hasNoWords;
    test('Empty string should return true', () {
      expect(hasNoWords(''), isTrue);
    });

    test('String with only spaces should return true', () {
      expect(hasNoWords('   '), isTrue);
    });

    test('String with special characters only should return true', () {
      expect(hasNoWords('!@#\$%^'), isTrue);
    });

    test('String with alphabets should return false', () {
      expect(hasNoWords('hello'), isFalse);
    });

    test('String with numbers should return false', () {
      expect(hasNoWords('123'), isFalse);
    });

    test('Mixed string with alphabets should return false', () {
      expect(hasNoWords('!@#hello'), isFalse);
    });

    test('Mixed string with numbers should return false', () {
      expect(hasNoWords('!!!123'), isFalse);
    });

    test('String with only whitespace characters should return true', () {
      expect(hasNoWords('\n\t\r'), isTrue);
    });

    test('String with emojis only should return true', () {
      expect(hasNoWords('😊🚀'), isTrue);
    });

    test('String with spaces and special characters should return true', () {
      expect(hasNoWords(' ! @ # '), isTrue);
    });
  });

  group('_doLastCharsIndicateAToStringMethod Tests', () {
    test('Should return true for toString method pattern', () {
      final result = validateCandidateStringUsecase
          .doLastCharsIndicateAToStringMethod('''@override
  String toString() {''');
      expect(result, isTrue);
    });

    test('Should return false for non toString method pattern', () {
      final result = validateCandidateStringUsecase
          .doLastCharsIndicateAToStringMethod('randomStringWithoutPattern');
      expect(result, isFalse);
    });
  });

  group('_doLastCharsIndicateAMapKey Tests', () {
    test('Should return true for map key pattern', () {
      final result1 = validateCandidateStringUsecase.doLastCharsIndicateAMapKey(
        'mapKey[',
      );
      final result2 = validateCandidateStringUsecase.doLastCharsIndicateAMapKey(
        'map Key[',
      );
      expect(result1, isTrue);
      expect(result2, isTrue);
    });

    test('Should return false for non map key pattern', () {
      final result1 = validateCandidateStringUsecase.doLastCharsIndicateAMapKey(
        '[',
      );
      final result2 = validateCandidateStringUsecase.doLastCharsIndicateAMapKey(
        ' [',
      );
      expect(result1, isFalse);
      expect(result2, isFalse);
    });
  });
}
