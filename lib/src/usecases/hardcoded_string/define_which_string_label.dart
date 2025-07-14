import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/cripto.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

@visibleForTesting
bool shouldAutomaticallyBeConsideredAValidString(String value) {
  final RegExp namePattern = RegExp(r'^[A-Z][a-z]+$');
  return namePattern.hasMatch(value);
}

@override
AsyncBabelResult<List<HardcodedStringEntity>> defineWhichStringLabel({
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
    final sha1Result = await generateSha1(string.value);
    if (sha1Result.isError()) {
      return sha1Result.asBabelResultErrorAsync();
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

  Future<BabelFailureResponse?> function() async {
    for (int i = 0; i < groups.length; i++) {
      final group = groups[i];
      if (!isSmallAmountOfStrings) {
        LoadingIndicator.instance.setLoadingProgressBar(
          message:
              'Analyzing which hardcoded strings are user-facing messages, labels, and descriptions...',
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

  // Filter the strings that needed validation based on the server responses
  final List<HardcodedStringEntity> apiValidatedStrings =
      stringsNeedingValidation.where((string) {
        final sha1 = shaMap[string.value]!;
        return combinedResults[sha1]!;
      }).toList();

  // Combine automatically valid strings with API-validated strings
  return [...automaticallyValidStrings, ...apiValidatedStrings].toSuccess();
}

AsyncBabelResult<GenerateFlowDefinedStringLabels>
generate_defineWhichStringLabel(GenerateFlowExtractedAllStrings payload) async {
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

  final labelStringsResult = await defineWhichStringLabel(
    client: payload.client.server,
    strings: payload.allExtractedStrings,
    projectApiToken: payload.projectApiToken,
    projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
  );

  if (labelStringsResult.isError()) {
    return labelStringsResult.asBabelResultErrorAsync();
  }

  final labelStrings = labelStringsResult.getOrThrow();

  // Save logs if requested
  if (payload.willLog) {
    await _saveStringListData(
      labelStrings.map((s) => s.toMap()).toList(),
      'step_2.json',
    );
  }

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

/// Saves data to a JSON file
Future<void> _saveStringListData(
  List<Map<String, dynamic>> data,
  String fileName,
) async {
  final outFile = File(p.join(Directory.current.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}
