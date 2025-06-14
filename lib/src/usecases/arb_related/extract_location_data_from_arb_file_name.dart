import 'package:collection/collection.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

Result<BabelSupportedLocales> extractFromArbFileName({
  required String filename,
}) {
  final extractedResponse = _extract(filename);
  if (extractedResponse.isError()) {
    return extractedResponse.asError();
  }

  final extracted = extractedResponse.getOrThrow();

  final exactMatch = BabelSupportedLocales.fromLocale(
    extracted.languageCode,
    extracted.countryCode,
  );

  if (exactMatch != null) {
    return exactMatch.toSuccess();
  }

  final approxMatch = BabelSupportedLocales.values.firstWhereOrNull(
    (locale) =>
        locale.languageCode.toLowerCase() ==
        extracted.languageCode.toLowerCase(),
  );

  if (approxMatch != null) {
    return approxMatch.toSuccess();
  }

  // Throw exception if no valid format is found
  return FormatException(
    'Invalid locale filename format: $filename.\nCould not determine language.\nMust be in format: "<base_name>_<languageCode>_<countryCode>.arb"\nIf "base_name" is "app", for example, see bellow valid options:\n- "app_en.arb"\n- "app_en_US.arb"\n- "app_enUS.arb"',
  ).toFailure();
}

Result<({String languageCode, String? countryCode})> _extract(String filename) {
  // Remove 'app_' prefix and '.arb' suffix if present
  String cleaned;

  if (filename.contains('_')) {
    final elements = filename.split('_');
    elements.removeAt(0);
    cleaned = elements.join('_');
    cleaned = cleaned.replaceAll('.arb', '');
  } else {
    cleaned = filename.replaceAll('.arb', '');
  }

  // Define regex patterns for both formats
  final underscorePattern = RegExp(
    r'([a-zA-Z]{2})_([a-zA-Z]{2})',
    caseSensitive: false,
  );
  final camelCasePattern = RegExp(
    r'([a-zA-Z]{2})([a-zA-Z]{2})',
    caseSensitive: false,
  );

  if (cleaned.length == 2) {
    return (languageCode: cleaned.toLowerCase(), countryCode: null).toSuccess();
  }

  // Try matching underscore format first
  var match = underscorePattern.firstMatch(cleaned);
  if (match != null) {
    return (
      languageCode: match.group(1)!.toLowerCase(),
      countryCode: match.group(2)!.toUpperCase(),
    ).toSuccess();
  }

  // If no underscore match, try camelCase format
  match = camelCasePattern.firstMatch(cleaned);
  if (match != null) {
    return (
      languageCode: match.group(1)!.toLowerCase(),
      countryCode: match.group(2)!.toUpperCase(),
    ).toSuccess();
  }

  // Throw exception if no valid format is found
  return FormatException(
    'Invalid locale filename format: $filename.\nCould not determine language.\nMust be in format: "<base_name>_<languageCode>_<countryCode>.arb"\nIf "base_name" is "app", for example, see bellow valid options:\n- "app_en.arb"\n- "app_en_US.arb"\n- "app_enUS.arb"',
  ).toFailure();
}
