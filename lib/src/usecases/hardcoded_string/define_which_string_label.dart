import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/cripto.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
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
AsyncBabelResult<List<HardcodedStringEntity>>
defineWhichStringLabelIsUserFacing({
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

  // Separate large strings (> 800 chars) from regular strings
  final List<HardcodedStringEntity> regularStrings = [];
  final List<HardcodedStringEntity> largeStrings = [];

  for (final string in stringsNeedingValidation) {
    if (string.value.trimHardcodedString.length > 400) {
      largeStrings.add(string);
    } else {
      regularStrings.add(string);
    }
  }

  // Create a map of SHA1 keys to string values for API validation
  final Map<L10nValue, Sha1> shaMap = {};

  // Process large strings individually with special error handling
  final Map<String, bool> combinedResults = {};

  // Handle large strings first - process individually
  for (final largeString in largeStrings) {
    final sha1Result = await generateSha1(largeString.value);
    if (sha1Result.isError()) {
      return sha1Result.asBabelResultErrorAsync();
    }
    final valueSha1 = sha1Result.getOrNull()!;
    shaMap[largeString.value] = valueSha1;

    // Create a map with only this single large string
    final singleStringMap = {valueSha1: largeString.value.trimHardcodedString};

    try {
      final result = await client.publicArbHelpers
          .analyseIfStringIsADisplayableLabel(
            projectApiToken: projectApiToken,
            projectShaIdentifier: projectShaIdentifier,
            extractedStrings: singleStringMap,
          );
      combinedResults.addAll(result);
    } catch (error) {
      // For large strings, on error we mark them as false instead of throwing
      combinedResults[valueSha1] = false;
    }
  }

  // Process regular strings with the existing batch logic
  final Map<Sha1, L10nValue> regularExtractedStrings = {};
  for (final string in regularStrings) {
    final sha1Result = await generateSha1(string.value);
    if (sha1Result.isError()) {
      return sha1Result.asBabelResultErrorAsync();
    }
    final valueSha1 = sha1Result.getOrNull()!;
    regularExtractedStrings[valueSha1] = string.value.trimHardcodedString;
    shaMap[string.value] = valueSha1;
  }

  // Only process regular strings if there are any
  if (regularStrings.isNotEmpty) {
    final groups = splitIntoManageableGroupsForApi(regularExtractedStrings, 1);

    final bool isSmallAmountOfStrings = groups.length <= 2;

    // Will use progress bar for larger datasets

    Future<BabelFailureResponse?> function() async {
      // Process groups in batches of 3 for parallel execution
      const batchSize = 3;
      int processedGroups = 0;

      for (
        int batchStart = 0;
        batchStart < groups.length;
        batchStart += batchSize
      ) {
        final batchEnd = (batchStart + batchSize).clamp(0, groups.length);
        final batch = groups.sublist(batchStart, batchEnd);

        // Update progress bar at the start of each batch
        if (!isSmallAmountOfStrings) {
          LoadingIndicator.instance.setLoadingProgressBar(
            message:
                'Analyzing which hardcoded strings are user-facing messages, labels, and descriptions...',
            barProgressInfo: BarProgressInfo(
              message: 'Analysing strings...',
              totalSteps: groups.length,
              currentStep: processedGroups + 1,
            ),
          );
        }

        // Create futures for parallel execution
        final futures = <Future<Map<String, bool>>>[];

        for (final group in batch) {
          futures.add(
            client.publicArbHelpers.analyseIfStringIsADisplayableLabel(
              projectApiToken: projectApiToken,
              projectShaIdentifier: projectShaIdentifier,
              extractedStrings: group,
            ),
          );
        }

        try {
          // Execute all futures in the batch in parallel
          final results = await Future.wait(futures);

          // Add all results to the combined map
          for (final result in results) {
            combinedResults.addAll(result);
            processedGroups++;

            // Update progress bar after each completed request
            if (!isSmallAmountOfStrings && processedGroups < groups.length) {
              LoadingIndicator.instance.setLoadingProgressBar(
                message:
                    'Analyzing which hardcoded strings are user-facing messages, labels, and descriptions...',
                barProgressInfo: BarProgressInfo(
                  message: 'Analysing strings...',
                  totalSteps: groups.length,
                  currentStep: processedGroups + 1,
                ),
              );
            }
          }
        } catch (error, stackTrace) {
          final BabelException babelException = BabelException(
            title: 'String analysis failed',
            description:
                'Failed to analyze strings with the AI service: "$error"\n'
                'Please check your API key and network connection, then try again. If the issue persists, contact support.',
          );
          return BabelFailureResponse.withErrorAndStackTrace(
            exception: babelException,
            error: error,
            stackTrace: stackTrace,
          );
        }
      }
      return null;
    }

    final BabelFailureResponse? error = await function();

    if (error != null) {
      return error.toFailure();
    }
  }

  // Filter the strings that needed validation based on the server responses
  final List<HardcodedStringEntity> apiValidatedStrings =
      stringsNeedingValidation.where((string) {
        final sha1 = shaMap[string.value];
        // Check if SHA exists and if the result is true
        return sha1 != null && combinedResults[sha1] == true;
      }).toList();

  // Combine automatically valid strings with API-validated strings
  return [...automaticallyValidStrings, ...apiValidatedStrings].toSuccess();
}

AsyncBabelResult<GenerateFlowDefinedStringLabels>
generate_defineWhichStringLabelIsUserFacing(
  GenerateFlowExtractedAllStrings payload,
) async {
  // Skip processing if there are no extracted strings
  if (payload.allExtractedStrings.isEmpty) {
    return GenerateFlowDefinedStringLabels(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: payload.filesVerificationState,
      projectArbData: payload.projectArbData,
      remapedArbKeys: payload.remapedArbKeys,
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      allExtractedStrings: payload.allExtractedStrings,
      labelStrings: <HardcodedStringEntity>[],
    ).toSuccess();
  }

  final labelStringsResult = await defineWhichStringLabelIsUserFacing(
    client: payload.client.server,
    strings: payload.allExtractedStrings,
    projectApiToken: payload.projectApiToken,
    projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
  );

  if (labelStringsResult.isError()) {
    return labelStringsResult.asBabelResultErrorAsync();
  }

  final labelStrings = labelStringsResult.getOrThrow();

  return GenerateFlowDefinedStringLabels(
    willLog: payload.willLog,
    projectApiToken: payload.projectApiToken,
    directoryPath: payload.directoryPath,
    inputedByUserLocale: payload.inputedByUserLocale,
    client: payload.client,
    yamlInfo: payload.yamlInfo,
    gitVariables: payload.gitVariables,
    maxLanguageCount: payload.maxLanguageCount,
    languages: payload.languages,
    projectCacheMap: payload.projectCacheMap,
    cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
    filesVerificationState: payload.filesVerificationState,
    projectArbData: payload.projectArbData,
    remapedArbKeys: payload.remapedArbKeys,
    codebaseArbTranslationPayloadInfo:
        payload.codebaseArbTranslationPayloadInfo,
    allExtractedStrings: payload.allExtractedStrings,
    labelStrings: labelStrings,
  ).toSuccess();
}
