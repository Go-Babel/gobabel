// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/usecases/arb_related/extract_location_data_from_arb_file_name.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';
import 'package:gobabel/src/usecases/arb_related/json_parser_with_line_tracking.dart';

AsyncBabelResult<ExtractArbDataResponse> extractArbDataFromFile(
  File file,
) async {
  // Babel locale
  final localeResponse = await extractFromArbFileName(filename: file.path);
  if (localeResponse.isError()) return localeResponse.asBabelResultErrorAsync();
  final BabelSupportedLocales locale = localeResponse.getOrThrow();

  // Read file content
  try {
    final String jsonContent = await file.readAsString();
    final arbDataResult = _extract(jsonContent);

    if (arbDataResult.isError()) {
      final failure = arbDataResult.fold(
        (_) => throw Exception('Should not be success'),
        (failure) => failure,
      );
      // Extract the BabelException from the failure
      final exception = failure.map(
        onlyBabelException: (f) => f.exception,
        withErrorAndStackTrace: (f) => f.exception,
      );
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: exception.title,
          description:
              'Failed to extract data from ARB file: "${file.path}".\n\n${exception.description}',
        ),
      ).toFailure();
    }

    final arbData = arbDataResult.getOrThrow();

    return ExtractArbDataResponse(
      fileName: file.path,
      placeHoldersCount: arbData.placeHoldersCount,
      allKeyValues: arbData.allKeyValues,
      locale: locale,
      variablesPlaceholdersPerKey: arbData.variablesPlaceholdersPerKey,
      keyLineNumbers: arbData.keyLineNumbers,
    ).toSuccess();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'ARB File Read Error',
        description:
            'Unable to read ARB file: "${file.path}".\nThis could be due to:\n- File permissions issues\n- File being locked by another process\n- Corrupted file content\n- Invalid character encoding\n\nPlease ensure the file is accessible and contains valid UTF-8 encoded text.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

AsyncBabelResult<List<ExtractArbDataResponse>> extractArbDataFromMultipleFiles(
  List<File> files,
) async {
  final List<ExtractArbDataResponse> results = [];

  for (final File file in files) {
    final result = await extractArbDataFromFile(file);
    if (result.isError()) {
      return result.asBabelResultErrorAsync();
    }
    results.add(result.getOrThrow());
  }

  return results.toSuccess();
}

ResultDart<
  ({
    int placeHoldersCount,
    Map<L10nKey, L10nValue> allKeyValues,
    Map<L10nKey, Set<VariableName>> variablesPlaceholdersPerKey,
    Map<L10nKey, int> keyLineNumbers,
  }),
  BabelFailureResponse
>
_extract(String jsonContent) {
  if (jsonContent.isEmpty) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Empty ARB Content',
        description:
            'The ARB file is empty. An ARB file must contain at least an empty JSON object "{}".',
      ),
    ).toFailure();
  }

  try {
    final Map<String, JsonKeyWithLineInfo> parsedData;
    try {
      parsedData = JsonParserWithLineTracking.parse(jsonContent);
    } catch (e) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Invalid JSON Format',
          description:
              'Failed to parse JSON content. Error: ${e.toString()}\n\n'
              'Common causes:\n'
              '• Missing or extra commas\n'
              '• Unclosed brackets or quotes\n'
              '• Invalid escape sequences\n'
              '• Non-UTF8 characters',
        ),
      ).toFailure();
    }

    int placeHoldersCount = 0;
    final Map<L10nKey, L10nValue> keyValues = {};
    final Map<L10nKey, Set<VariableName>> variablesPlaceholdersPerKey = {};
    final Map<L10nKey, int> keyLineNumbers = {};

    // First pass: collect translation keys and values
    for (final entry in parsedData.entries) {
      final key = entry.key;
      final keyInfo = entry.value;
      final value = keyInfo.value;

      final isTranslationKey = !key.startsWith('@');
      if (isTranslationKey) {
        if (value is! String) {
          return BabelFailureResponse.onlyBabelException(
            exception: BabelException(
              title: 'Invalid Translation Value',
              description:
                  'Translation key "$key" has a non-string value.\n'
                  'Found type: ${value.runtimeType}\n'
                  'Value: $value\n\n'
                  'All translation values must be strings.',
            ),
          ).toFailure();
        }
        // Store the key as-is for now, it will be processed later
        keyValues[key] = value;
        keyLineNumbers[key] = keyInfo.lineNumber;
        variablesPlaceholdersPerKey[key] = <VariableName>{};
      } else {
        placeHoldersCount++;
      }
    }

    // Second pass: extract placeholders from metadata (keys starting with @)
    for (final entry in parsedData.entries) {
      final key = entry.key;
      final keyInfo = entry.value;
      final value = keyInfo.value;

      if (key.startsWith('@')) {
        if (value is! Map<String, dynamic>) {
          // Skip non-map metadata entries (they might be valid but we don't process them)
          continue;
        }

        final String targetKey = key.substring(1); // Remove @ prefix
        if (!keyValues.containsKey(targetKey)) {
          // Metadata for non-existent key - this is allowed but we skip it
          continue;
        }

        final placeholders = value['placeholders'];
        if (placeholders != null) {
          if (placeholders is! Map<String, dynamic>) {
            return BabelFailureResponse.onlyBabelException(
              exception: BabelException(
                title: 'Invalid Placeholders Format',
                description:
                    'The placeholders for key "$targetKey" must be a JSON object.\n'
                    'Found type: ${placeholders.runtimeType}\n'
                    'Expected format: {"placeholders": {"variableName": {...}, ...}}',
              ),
            ).toFailure();
          }
          final Set<VariableName> variables = placeholders.keys.toSet();
          variablesPlaceholdersPerKey[targetKey] = variables;
        }
      }
    }

    if (keyValues.isEmpty) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'No Translations Found',
          description:
              'The ARB file does not contain any translation keys.\n'
              'Translation keys are non-@ prefixed keys with string values.\n'
              'Found ${parsedData.length} total keys, but all appear to be metadata.',
        ),
      ).toFailure();
    }

    return Success((
      placeHoldersCount: placeHoldersCount,
      allKeyValues: keyValues,
      variablesPlaceholdersPerKey: variablesPlaceholdersPerKey,
      keyLineNumbers: keyLineNumbers,
    ));
  } catch (e, stackTrace) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Unexpected ARB Extraction Error',
        description:
            'An unexpected error occurred while extracting ARB data.\n'
            'Error: ${e.toString()}\n'
            'Stack trace: ${stackTrace.toString().split('\n').take(5).join('\n')}',
      ),
    ).toFailure();
  }
}

class ExtractArbDataResponse {
  final String fileName;
  final int placeHoldersCount;
  final Map<L10nKey, L10nValue> allKeyValues;
  final BabelSupportedLocales locale;
  final Map<L10nKey, Set<VariableName>> variablesPlaceholdersPerKey;
  final Map<L10nKey, int> keyLineNumbers;

  const ExtractArbDataResponse({
    required this.fileName,
    required this.placeHoldersCount,
    required this.allKeyValues,
    required this.locale,
    required this.variablesPlaceholdersPerKey,
    required this.keyLineNumbers,
  });
}
