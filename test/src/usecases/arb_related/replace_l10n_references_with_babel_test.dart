import 'package:gobabel/src/usecases/arb_related/replace_l10n_references_with_babel.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:test/test.dart';

void main() {
  test('real world example - enum', () {
    final result = replaceL10nReferencesWithBabel(
      fileContent: enumExampleResponse,
      outputClass: 'S',
      clusteredRemapedArbs: <List<L10nKey>>[
        <L10nKey>[
          'below_3_months_or_less_to_expire',
          'between_3_and_6_months_to_expire',
          'more_than_6_months_to_expire',
          'already_expired',
          'unknown',
        ],
      ],
      remapedArbKeys: {
        "already_expired": "alreadyExpired",
        "below_3_months_or_less_to_expire": "below3MonthsOrLessToExpire",
        "between_3_and_6_months_to_expire": "between3And6MonthsToExpire",
        "more_than_6_months_to_expire": "moreThan6MonthsToExpire",
        "unknown": "unknown",
      },
      keyToImplementation: {
        "alreadyExpired": "Babel.alreadyExpired()",
        "below3MonthsOrLessToExpire": "Babel.below3MonthsOrLessToExpire()",
        "between3And6MonthsToExpire": "Babel.between3And6MonthsToExpire()",
        "moreThan6MonthsToExpire": "Babel.moreThan6MonthsToExpire()",
        "unknown": "Babel.unknown()",
      },
    );
    print('hadChanges: ${result.hasChanges}');
    print(result.content);
  });
}

final String enumExampleResponse = '''import 'package:flutter/material.dart';
import 'package:scoutbox/babel_text.dart';


enum ExpirationDateScope {
  alreadyExpired,
  lessOrEqualTo3MonthsToExpire,
  betweenMoreThen3AndLessThen6MonthsToExpire,
  moreThen6MonthsToExpire,
  unknown;

  String display(BuildContext context) {
    switch (this) {
      case ExpirationDateScope.alreadyExpired:
        return S.of(context)!.already_expired;
      case ExpirationDateScope.lessOrEqualTo3MonthsToExpire:
        return S.of(context)!.below_3_months_or_less_to_expire;
      case ExpirationDateScope.betweenMoreThen3AndLessThen6MonthsToExpire:
        return S.of(context)!.between_3_and_6_months_to_expire;
      case ExpirationDateScope.moreThen6MonthsToExpire:
        return S.of(context)!.more_than_6_months_to_expire;
      case ExpirationDateScope.unknown:
        return S.of(context)!.unknown;
    }
  }

  String get code {
    switch (this) {
      case ExpirationDateScope.alreadyExpired:
        return 'expired';
      case ExpirationDateScope.lessOrEqualTo3MonthsToExpire:
        return 'within_three_months';
      case ExpirationDateScope.betweenMoreThen3AndLessThen6MonthsToExpire:
        return 'between_three_and_six_months';
      case ExpirationDateScope.moreThen6MonthsToExpire:
        return 'more_than_six_months';
      case ExpirationDateScope.unknown:
        return 'unknown';
    }
  }

  Color getColor() {
    switch (this) {
      case ExpirationDateScope.alreadyExpired:
        return Colors.transparent;
      case ExpirationDateScope.lessOrEqualTo3MonthsToExpire:
        return const Color(0xFFFFA800);
      case ExpirationDateScope.betweenMoreThen3AndLessThen6MonthsToExpire:
        return const Color(0xFFFF4A01);
      case ExpirationDateScope.moreThen6MonthsToExpire:
        return const Color(0xFF27AE60);
      case ExpirationDateScope.unknown:
        return const Color(0xff216AC3);
    }
  }
}''';

final String expectedEnumExampleResponse =
    '''import 'package:flutter/material.dart';
import 'package:scoutbox/babel_text.dart';


enum ExpirationDateScope {
  alreadyExpired,
  lessOrEqualTo3MonthsToExpire,
  betweenMoreThen3AndLessThen6MonthsToExpire,
  moreThen6MonthsToExpire,
  unknown;

  String display(BuildContext context) {
    switch (this) {
      case ExpirationDateScope.alreadyExpired:
        return Babel.alreadyExpired();
      case ExpirationDateScope.lessOrEqualTo3MonthsToExpire:
        return Babel.below3MonthsOrLessToExpire();
      case ExpirationDateScope.betweenMoreThen3AndLessThen6MonthsToExpire:
        return Babel.between3And6MonthsToExpire();
      case ExpirationDateScope.moreThen6MonthsToExpire:
        return Babel.moreThan6MonthsToExpire();
      case ExpirationDateScope.unknown:
        return Babel.unknown();
    }
  }

  String get code {
    switch (this) {
      case ExpirationDateScope.alreadyExpired:
        return 'expired';
      case ExpirationDateScope.lessOrEqualTo3MonthsToExpire:
        return 'within_three_months';
      case ExpirationDateScope.betweenMoreThen3AndLessThen6MonthsToExpire:
        return 'between_three_and_six_months';
      case ExpirationDateScope.moreThen6MonthsToExpire:
        return 'more_than_six_months';
      case ExpirationDateScope.unknown:
        return 'unknown';
    }
  }

  Color getColor() {
    switch (this) {
      case ExpirationDateScope.alreadyExpired:
        return Colors.transparent;
      case ExpirationDateScope.lessOrEqualTo3MonthsToExpire:
        return const Color(0xFFFFA800);
      case ExpirationDateScope.betweenMoreThen3AndLessThen6MonthsToExpire:
        return const Color(0xFFFF4A01);
      case ExpirationDateScope.moreThen6MonthsToExpire:
        return const Color(0xFF27AE60);
      case ExpirationDateScope.unknown:
        return const Color(0xff216AC3);
    }
  }
}''';
