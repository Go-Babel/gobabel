import 'dart:io';

import 'package:collection/collection.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<BabelSupportedLocales> extractFromArbFileName({
  required String filename,
}) async {
  // Maybe its a full path, so we extract the file name
  filename =
      filename.contains(Platform.pathSeparator)
          ? filename.split(Platform.pathSeparator).last
          : filename;

  final extractedResponse = _extract(filename);
  if (extractedResponse.isError()) {
    return extractedResponse.asErrorAsync();
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
  return BabelException(
    title: 'Invalid ARB Filename Format',
    description: 'The filename "$filename" does not follow the expected ARB naming convention.\n\nExpected format: "<base_name>_<languageCode>_<countryCode>.arb"\n\nValid examples (assuming base name is "app"):\n- app_en.arb (English)\n- app_en_US.arb (English - United States)\n- app_pt_BR.arb (Portuguese - Brazil)\n\nThe language code must be 2 characters and the country code (if provided) must also be 2 characters.',
  ).toFailure();
}

Result<({String languageCode, String? countryCode})> _extract(String filename) {
  // Remove 'app_' prefix and '.arb' suffix if present
  String cleaned;

  if (filename.contains('_')) {
    final elements = filename.split('_');
    if (elements.isNotEmpty) {
      elements.removeAt(0);
      cleaned = elements.join('_');
      cleaned = cleaned.replaceAll('.arb', '');
    } else {
      cleaned = filename.replaceAll('.arb', '');
    }
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
  return BabelException(
    title: 'Invalid ARB Filename Format',
    description: 'The filename "$filename" does not follow the expected ARB naming convention.\n\nExpected format: "<base_name>_<languageCode>_<countryCode>.arb"\n\nValid examples (assuming base name is "app"):\n- app_en.arb (English)\n- app_en_US.arb (English - United States)\n- app_pt_BR.arb (Portuguese - Brazil)\n\nThe language code must be 2 characters and the country code (if provided) must also be 2 characters.',
  ).toFailure();
}
