import 'package:gobabel/src/core/extensions/string_extensions.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/map_strings.dart';

extension StringExtensions on String {
  String get transformSpecialCharsIfNeeded {
    final startWithDigit = RegExp(r'^[0-9]');
    if (startWithDigit.hasMatch(this)) {
      // If start with digit, add a "u" prefix
      return 'd$this';
    }

    final reg = RegExp(r'[a-zA-Z0-9]*', multiLine: true);
    final refLenght = replaceAll(reg, '').length;
    final bool isAllCaractersAreSpecialChars = refLenght == length;

    if (isAllCaractersAreSpecialChars == false) {
      // Does not need to transform special chars
      return this;
    }

    final Map<String, String> specialCharNames = {
      '-': 'dash',
      '_': 'underline',
      '~': 'tilde',
      ':': 'colon',
      '!': 'exclamation mark',
      '"': 'quotation mark',
      '#': 'number sign',
      r'$': 'dollar sign',
      '%': 'percent sign',
      '&': 'ampersand',
      "'": 'apostrophe',
      '(': 'left parenthesis',
      ')': 'right parenthesis',
      '*': 'asterisk',
      '+': 'plus sign',
      ',': 'comma',
      '.': 'full stop',
      r'\/': 'solidus',
      ';': 'semicolon',
      '<': 'less-than sign',
      '=': 'equals sign',
      '>': 'greater-than sign',
      '?': 'question mark',
      '@': 'commercial at',
      r'\]': 'right square bracket',
      '[': 'left square bracket',
      r'\\': 'reverse solidus',
      '^': 'circumflex accent',
      '`': 'grave accent',
      '{': 'left curly bracket',
      '|': 'vertical line',
      '}': 'right curly bracket',
    };
    final String regText = '[${specialCharNames.keys.join()}]';

    final result =
        replaceAllMapped(RegExp(regText, multiLine: true), (match) {
          final String matchedChar = match.group(0)!;
          final String? specialCharName =
              specialCharNames[<String>[']', r'\', '/'].contains(matchedChar)
                  ? '\\$matchedChar'
                  : matchedChar];
          return specialCharName != null ? ' $specialCharName ' : matchedChar;
        }).trim();

    // Still the same? add a "u" prefix
    final bool isStillAllCaractersAreSpecialChars =
        result.replaceAll(reg, '').length == length;
    if (isStillAllCaractersAreSpecialChars) {
      return 'u $result';
    }

    return result;
  }

  String withoutVariables(Set<VariableName> variableNames) {
    return (variableNames.isEmpty
            ? this
            : split(
              RegExp(
                variableNames.map((vN) => '{$vN}').join('|'),
                multiLine: true,
              ),
            ).join('_'))
        .toCamelCase;
  }

  String asArbCase(Set<VariableName> variableNames) {
    return transformSpecialCharsIfNeeded.withoutVariables(variableNames);
  }

  String toNewArbCase(Set<VariableName> variableNames) {
    return garanteeIsNewKey(asArbCase(variableNames));
  }
}
