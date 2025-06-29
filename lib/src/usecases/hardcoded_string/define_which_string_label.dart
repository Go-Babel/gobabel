import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/loading_indicator.dart';
import 'package:gobabel/src/core/utils/cripto.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

@visibleForTesting
bool shouldAutomaticallyBeConsideredAValidString(String value) {
  final RegExp namePattern = RegExp(r'^[A-Z][a-z]+$');
  return namePattern.hasMatch(value);
}

@override
AsyncResult<List<HardcodedStringEntity>> defineWhichStringLabelUsecase({
  required List<HardcodedStringEntity> strings,
  required Client client,
  required String projectApiToken,
  required BigInt projectShaIdentifier,
}) async {
  if (strings.isEmpty) return <HardcodedStringEntity>[].toSuccess();

  // Separate strings that are automatically valid from those needing API validation
  final List<HardcodedStringEntity> automaticallyValidStrings = [];
  final List<HardcodedStringEntity> stringsNeedingValidation = [];

  for (final string in strings) {
    if (shouldAutomaticallyBeConsideredAValidString(
      string.value.trimHardcodedString,
    )) {
      automaticallyValidStrings.add(string);
    } else {
      stringsNeedingValidation.add(string);
    }
  }

  // If no strings need API validation, return the automatically valid ones
  if (stringsNeedingValidation.isEmpty) {
    return automaticallyValidStrings.toSuccess();
  }

  // Create a map of SHA1 keys to string values for API validation
  final Map<L10nValue, Sha1> shaMap = {};
  final Map<Sha1, L10nValue> extractedStrings = {};
  for (final string in stringsNeedingValidation) {
    final sha1Result = generateSha1(string.value);
    if (sha1Result.isError()) {
      return sha1Result.asError();
    }
    final valueSha1 = sha1Result.getOrNull()!;
    extractedStrings[valueSha1] = string.value.trimHardcodedString;
    shaMap[string.value] = valueSha1;
  }

  // Process each group and combine results
  final Map<String, bool> combinedResults = {};

  final groups = splitIntoManageableGroupsForApi(extractedStrings);

  final bool isSmallAmountOfStrings = groups.length <= 2;

  // Will use progress bar for larger datasets

  Future<BabelException?> function() async {
    for (int i = 0; i < groups.length; i++) {
      final group = groups[i];
      if (!isSmallAmountOfStrings) {
        LoadingIndicator.instance.setLoadingState(
          message: 'Analyzing which hardcoded strings are user-facing messages, labels, and descriptions...',
          totalCount: groups.length,
          step: i + 1,
          barProgressInfo: BarProgressInfo(
            message: 'Analysing strings...',
            totalSteps: groups.length,
            currentStep: i + 1,
          ),
        );
      }
      try {
        final result = await client.publicArbHelpers
            .analyseIfStringIsADisplayableLabel(
              projectApiToken: projectApiToken,
              projectShaIdentifier: projectShaIdentifier,
              extractedStrings: group,
            );
        combinedResults.addAll(result);
      } catch (e) {
        return BabelException(
          title: 'String analysis failed',
          description: 'Failed to analyze strings with the AI service: $e '
              'Please check your API key and network connection, then try again.',
        );
      }
    }
    return null;
  }

  final BabelException? error;
  if (isSmallAmountOfStrings) {
    LoadingIndicator.instance.setLoadingState(
      message: 'Analyzing which hardcoded strings are user-facing messages, labels, and descriptions...',
      totalCount: 1,
      step: 1,
      barProgressInfo: null,
    );
    error = await function();
    LoadingIndicator.instance.dispose();
  } else {
    error = await function();
    LoadingIndicator.instance.dispose();
  }
  
  if (error != null) {
    return error.toFailure();
  }

  // Filter the strings that needed validation based on the server responses
  final List<HardcodedStringEntity> apiValidatedStrings =
      stringsNeedingValidation.where((string) {
        final sha1 = shaMap[string.value]!;
        return combinedResults[sha1]!;
      }).toList();

  // Combine automatically valid strings with API-validated strings
  return [...automaticallyValidStrings, ...apiValidatedStrings].toSuccess();
}
