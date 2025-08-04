import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/arb_related/extract_arb_data_from_file.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<ArbDataState> mapProjectArbDataUsecase({
  required L10nProjectConfig n10nProjectConfig,
  required int maxLanguageCount,
  required Directory directory,
  required BabelSupportedLocales inputedByUserLocale,
}) async {
  final L10nProjectConfigWithData? config = n10nProjectConfig.mapOrNull(
    withData: (data) => data,
  );
  if (config == null) {
    return ArbDataState.noneData().toSuccess();
  }
  final List<File> allFiles;

  try {
    final List<FileSystemEntity> items = directory.listSync(
      recursive: true,
      followLinks: false,
    );

    allFiles =
        items
            .whereType<File>()
            .where((file) => file.path.endsWith('.arb'))
            .toList();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Directory Listing Error',
        description:
            'Failed to list ARB files in directory "${directory.path}"\n\nPlease ensure the directory exists and is accessible.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }

  final extractedFileDataResponse = await extractArbDataFromMultipleFiles(
    allFiles,
  );
  if (extractedFileDataResponse.isError()) {
    return extractedFileDataResponse.asBabelResultErrorAsync();
  }

  final List<ExtractArbDataResponse> allArbData = [
    ...extractedFileDataResponse.getOrThrow(),
  ];
  if (allArbData.isNotEmpty) {
    // Depending on the plan, we can have a different amount of languages
    final maxAmountOfLanguagesInProjectPlanTier = maxLanguageCount;
    if (allArbData.length > maxAmountOfLanguagesInProjectPlanTier) {
      final String message =
          'The project subscription plan allows a maximum of $maxAmountOfLanguagesInProjectPlanTier languages.\n'
          'The project has ${allArbData.length} languages.\n'
          'Please ${"remove".hotPink} the extra languages from the project or ${"upgrade".greenYellow} the plan to a one that suports more languages.';
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Language Limit Exceeded',
          description: message,
        ),
      ).toFailure();
    }
  }

  // late ArbFileData mainPreMadeTranslationArb;
  final List<ArbFileData> preMadeTranslationArb = [];

  if (allArbData.isEmpty) {
    return ArbDataState.noneData().toSuccess();
  }

  final targetArbName = config.arbDir;
  // Get the one with most placeholders. That should be the main
  // If the number of placeholders is the same, get the one with most keyValues
  // If it still is the same, get the one with that ends with target arbName
  // If it still is the same, get the first one
  allArbData.sort((a, b) {
    final placeHoldersDiff = b.placeHoldersCount - a.placeHoldersCount;
    if (placeHoldersDiff != 0) {
      return placeHoldersDiff;
    }

    final keyValuesDiff = b.allKeyValues.length - a.allKeyValues.length;
    if (keyValuesDiff != 0) {
      return keyValuesDiff;
    }

    final aEndsWith = a.fileName.endsWith(targetArbName);
    final bEndsWith = b.fileName.endsWith(targetArbName);
    if (aEndsWith && !bEndsWith) {
      return 1;
    } else if (!aEndsWith && bEndsWith) {
      return -1;
    }

    return 0;
  });

  // The main is the one with more count of placeholders
  final ExtractArbDataResponse main = allArbData.reduce((a, b) {
    return a.placeHoldersCount > b.placeHoldersCount ? a : b;
  });

  // Main should have all the keys
  final List<MissingKeyInfo> pendingKeys = retrivePendingKeys(
    main: main,
    allArbData: allArbData,
  );

  if (pendingKeys.isNotEmpty) {
    final StringBuffer description = StringBuffer();
    description.writeln(
      'The reference ARB file "${main.fileName.split('/').last}" is missing some keys that exist in other ARB files.\n',
    );
    description.writeln(
      '┌─ Missing keys in main arb file (${main.fileName.split('/').last}):',
    );
    description.writeln('│');

    for (int i = 0; i < pendingKeys.length; i++) {
      final missingKey = pendingKeys[i];
      final isLast = i == pendingKeys.length - 1;
      final keyDisplay =
          missingKey.key.isEmpty ? '"" (empty string)' : '"${missingKey.key}"';

      description.writeln('${isLast ? "└" : "├"}──┬─ $keyDisplay');

      for (int j = 0; j < missingKey.locations.length; j++) {
        final location = missingKey.locations[j];
        final isLastLocation = j == missingKey.locations.length - 1;
        final prefix = isLast ? '   ' : '│  ';
        description.writeln(
          '$prefix${isLastLocation ? "└" : "├"}──── at line ${location.lineNumber}, in "${location.fileName}"',
        );
      }

      if (!isLast) {
        description.writeln('│');
      }
    }

    description.writeln(
      '\nThe reference ARB file must contain all keys used across all language files. Please add the missing keys to ensure proper translation management.',
    );

    final isAnyInMainArbEmpty = main.allKeyValues.keys.any(
      (key) => key.isEmpty,
    );
    if (isAnyInMainArbEmpty) {
      throw BabelException(
        title: 'Empty Key in Main ARB',
        description:
            'The main ARB file "${main.fileName.split('/').last}" contains an empty key. Please remove it or replace it with a valid key.',
      );
    }

    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Missing Keys in Reference ARB',
        description: description.toString(),
      ),
    ).toFailure();
  }

  // The original code was incorrectly using allKeyValues as a key mapping
  // Simply use the ARB data as-is since key transformation happens later
  final allArbs =
      allArbData.map((arbData) {
        return ArbFileData(
          locale: arbData.locale,
          allKeyValues: Map.from(arbData.allKeyValues),
        );
      }).toList();

  preMadeTranslationArb.addAll(allArbs);

  // Sum of all variablesPlaceholdersPerKey
  final Map<TranslationKey, Set<VariableName>> variablesPlaceholdersPerKey = {};
  for (final arb in allArbData) {
    arb.variablesPlaceholdersPerKey.forEach((key, value) {
      if (variablesPlaceholdersPerKey.containsKey(key)) {
        variablesPlaceholdersPerKey[key]!.addAll(value);
      } else {
        variablesPlaceholdersPerKey[key] = Set.from(value);
      }
    });
  }

  final containsInputedByUserLocale = preMadeTranslationArb.any(
    (arb) => arb.locale == inputedByUserLocale,
  );

  if (containsInputedByUserLocale == false) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title:
            'No arb file found for the reference language $inputedByUserLocale',
        description:
            'The reference language used as parameter does not have a corresponding ARB file in the project. For that reason, it can not be the reference language for the project.\n'
            'The languages found in the project are:\n${preMadeTranslationArb.map((arb) => arb.locale).join(', ')}',
      ),
    ).toFailure();
  }

  return ArbDataState.withData(
    config: config,
    preMadeTranslationArb: preMadeTranslationArb,
    mainLocale: main.locale,
    variablesPlaceholdersPerKey: variablesPlaceholdersPerKey,
  ).toSuccess();
}

class MissingKeyInfo {
  final String key;
  final List<({String fileName, int lineNumber})> locations;

  const MissingKeyInfo({required this.key, required this.locations});
}

List<MissingKeyInfo> retrivePendingKeys({
  required ExtractArbDataResponse main,
  required List<ExtractArbDataResponse> allArbData,
}) {
  final listCopy = List<ExtractArbDataResponse>.from(allArbData);
  listCopy.removeWhere((arb) => arb.fileName == main.fileName);
  final Map<String, List<({String fileName, int lineNumber})>> pendingKeysInfo =
      {};

  for (final arb in listCopy) {
    final keys = arb.allKeyValues.keys;
    for (final key in keys) {
      if (!main.allKeyValues.containsKey(key)) {
        if (!pendingKeysInfo.containsKey(key)) {
          pendingKeysInfo[key] = [];
        }
        final lineNumber = arb.keyLineNumbers[key] ?? 0;
        pendingKeysInfo[key]!.add((
          fileName:
              arb.fileName
                  .split('/')
                  .last, // Only show file name, not full path
          lineNumber: lineNumber,
        ));
      }
    }
  }

  return pendingKeysInfo.entries
      .map((entry) => MissingKeyInfo(key: entry.key, locations: entry.value))
      .toList();
}

AsyncBabelResult<GenerateFlowMappedProjectArbData>
generate_mapProjectArbDataUsecase(
  GenerateFlowGotL10nProjectConfig payload,
) async {
  return mapProjectArbDataUsecase(
    inputedByUserLocale: payload.inputedByUserLocale,
    n10nProjectConfig: payload.l10nProjectConfig,
    maxLanguageCount: payload.maxLanguageCount,
    directory: payload.directory,
  ).map((arbDataState) {
    return GenerateFlowMappedProjectArbData(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directory.path,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: payload.filesVerificationState,
      projectArbData: arbDataState,
    );
  });
}
