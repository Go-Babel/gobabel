// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:gobabel/src/usecases/arb_related/extract_location_data_from_arb_file_name.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<ExtractArbDataResponse> extractArbDataFromFile(File file) async {
  // Babel locale
  final localeResponse = await extractFromArbFileName(filename: file.path);
  if (localeResponse.isError()) return localeResponse.asError();
  final BabelSupportedLocales locale = localeResponse.getOrThrow();

  // Read file content
  try {
    final String jsonContent = await file.readAsString();
    final arbData = _extract(jsonContent);

    if (arbData == null) {
      return Exception(
        'Failed to extract data from ARB file: ${file.path}',
      ).toFailure();
    }

    return ExtractArbDataResponse(
      fileName: file.path,
      placeHoldersCount: arbData.placeHoldersCount,
      allKeyValues: arbData.allKeyValues,
      locale: locale,
      variablesPlaceholdersPerKey: arbData.variablesPlaceholdersPerKey,
    ).toSuccess();
  } catch (e) {
    return Exception(
      'Error reading ARB file: ${file.path}. Error: $e',
    ).toFailure();
  }
}

AsyncResult<List<ExtractArbDataResponse>> extractArbDataFromMultipleFiles(
  List<File> files,
) async {
  final List<ExtractArbDataResponse> results = [];

  for (final File file in files) {
    final result = await extractArbDataFromFile(file);
    if (result.isError()) {
      return result.asErrorAsync();
    }
    results.add(result.getOrThrow());
  }

  return results.toSuccess();
}

({
  int placeHoldersCount,
  Map<L10nKey, L10nValue> allKeyValues,
  Map<L10nKey, Set<VariableName>> variablesPlaceholdersPerKey,
})?
_extract(String jsonContent) {
  if (jsonContent.isEmpty) {
    return null;
  }

  try {
    final json = jsonDecode(jsonContent) as Map<String, dynamic>;

    int placeHoldersCount = 0;
    final Map<L10nKey, L10nValue> keyValues = {};
    final Map<L10nKey, Set<VariableName>> variablesPlaceholdersPerKey = {};

    json.forEach((key, value) {
      final isTranslationKey = key.startsWith('@') == false;
      if (isTranslationKey) {
        keyValues[key] = value;
        variablesPlaceholdersPerKey[key] = <VariableName>{};
      } else {
        placeHoldersCount++;
      }
    });

    // Extract placeholders from metadata (keys starting with @)
    json.forEach((key, value) {
      if (key.startsWith('@') && value is Map<String, dynamic>) {
        final String targetKey = key.substring(1); // Remove @ prefix
        if (keyValues.containsKey(targetKey)) {
          final placeholders = value['placeholders'];
          if (placeholders is Map<String, dynamic>) {
            final Set<VariableName> variables = placeholders.keys.toSet();
            variablesPlaceholdersPerKey[targetKey] = variables;
          }
        }
      }
    });

    return (
      placeHoldersCount: placeHoldersCount,
      allKeyValues: keyValues,
      variablesPlaceholdersPerKey: variablesPlaceholdersPerKey,
    );
  } catch (e) {
    return null;
  }
}

class ExtractArbDataResponse {
  final String fileName;
  final int placeHoldersCount;
  final Map<L10nKey, L10nValue> allKeyValues;
  final BabelSupportedLocales locale;
  final Map<L10nKey, Set<VariableName>> variablesPlaceholdersPerKey;

  const ExtractArbDataResponse({
    required this.fileName,
    required this.placeHoldersCount,
    required this.allKeyValues,
    required this.locale,
    required this.variablesPlaceholdersPerKey,
  });
}
