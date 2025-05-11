import 'package:gobabel/src/core/utils/case_identify.dart';
import 'package:gobabel/src/scripts/extract_strings_related/validate_candidate_string.dart';
import 'package:test/test.dart';

final List<String> _nonImportCaseTest = [
  'this.is.dot.case',
  'This-Is-Header-Case',
  'This.Is.Pascal.Dot.Case',
  'ThisIsPascalCase',
  'this-is-param-case',
  'this_is_snake_case',
  'this/is/path/case.dart',
  'thisIsCamelCase',
  'thisisatest',
  'this is a test with spaces',
  'this is a test with special characters !@#\$%^&*()',
];

final List<String> _importCaseTest = [
  'dart:async',
  'dart:convert',
  'dart:io',
  'dart:isolate',
  'package:collection/collection.dart',
  'package:dartz/dartz.dart',
  'package:player_source_models/extensions/datetime.dart',
  'package:dsf_commum_data_source/dsf_commum_data_source.dart',
  'package:enchanted_collection/enchanted_collection.dart',
  'package:flutter/foundation.dart',
  'package:player_source_models/extensions/either.dart',
  'package:player_source_models/extensions/string.dart',
  'package:player_source_models/models/detailed_position.dart',
  'package:player_source_models/models/e_country.dart',
  'package:player_source_models/models/e_level.dart',
  'package:player_source_models/models/e_status.dart',
  'package:player_source_models/models/player_season_average.dart',
  'package:player_source_models/models/playing_style.dart',
  'package:player_source_models/models/simplified_position.dart',
  'package:player_source_models/models/spreedsheet/spreadsheet_model.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/career_stat.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/championship_stat.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/in_fields_stat.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_advanced_stats.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_contact.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_detail.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_market_situation.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/remote_config.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/team_player_avarage_stats.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/transfermarkt_data.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/wyscout_data.dart',
  'package:uuid/uuid.dart',
];

void main() {
  final ValidateCandidateStringUsecase validateCandidateStringUsecase =
      ValidateCandidateStringUsecase();

  group('Text Format Cases Tests', () {
    test('Import case shoudl not pass', () {
      final List<bool> negativeResults =
          _nonImportCaseTest
              .map(
                (String importCase) =>
                    CaseIdentifyRegex.isImportCase(importCase),
              )
              .toList();

      final List<bool> positiveResults =
          _importCaseTest
              .map(
                (String importCase) =>
                    CaseIdentifyRegex.isImportCase(importCase),
              )
              .toList();

      final List<bool> validateCandidateStringPositiveResults =
          _importCaseTest
              .map(
                (String importCase) => validateCandidateStringUsecase.call(
                  content: importCase,
                  last50CharsBeforeContent: '',
                ),
              )
              .toList();

      expect(
        negativeResults,
        equals(List.generate(negativeResults.length, (_) => false)),
      );
      expect(
        positiveResults,
        equals(List.generate(positiveResults.length, (_) => true)),
      );
      expect(
        validateCandidateStringPositiveResults,
        equals(
          List.generate(
            validateCandidateStringPositiveResults.length,
            (_) => false,
          ),
        ),
      );
    });

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
        content: 'this/is/path/case.dart',
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
