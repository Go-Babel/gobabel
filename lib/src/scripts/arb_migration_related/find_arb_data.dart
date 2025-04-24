// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:io';
import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/scripts/arb_migration_related/extract_location_data_from_arb_file_name.dart';
import 'package:gobabel/src/scripts/arb_migration_related/garantee_uniqueness_of_keys.dart';
import 'package:gobabel/src/scripts/arb_migration_related/infer_declaration_function_from_arb_json.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel/src/scripts/arb_migration_related/get_project_yaml_config.dart';

class FindArbDataUsecase {
  final ExtractLocationDataFromArbFileNameUsecase
  _extractLocationDataFromArbFileName;
  final GaranteeUniquenessOfKeysUsecase _garanteeUniquenessOfKeys;
  final GetProjectYamlConfigUsecase _getProjectYamlConfig;
  final InferDeclarationFunctionFromArbJsonUsecase
  _inferDeclarationFunctionFromArbJson;
  const FindArbDataUsecase({
    required GetProjectYamlConfigUsecase getProjectYamlConfig,
    required ExtractLocationDataFromArbFileNameUsecase
    extractLocationDataFromArbFileName,
    required GaranteeUniquenessOfKeysUsecase garanteeUniquenessOfKeys,
    required InferDeclarationFunctionFromArbJsonUsecase
    inferDeclarationFunctionFromArbJson,
  }) : _getProjectYamlConfig = getProjectYamlConfig,
       _extractLocationDataFromArbFileName = extractLocationDataFromArbFileName,
       _garanteeUniquenessOfKeys = garanteeUniquenessOfKeys,
       _inferDeclarationFunctionFromArbJson =
           inferDeclarationFunctionFromArbJson;

  Future<void> call() async {
    final Directory curr = Dependencies.targetDirectory;
    final List<FileSystemEntity> currList = await curr.list().toList();

    final L10nProjectConfig? projConfig = await _getProjectYamlConfig(
      currList.whereType<File>().toList(),
    );
    if (projConfig == null) return;

    final targetDir = Directory(projConfig.arbDir);
    Dependencies.arbData = await _getAllL10nKey(targetDir, projConfig);
  }

  Future<ArbData?> _getAllL10nKey(
    Directory dir,
    L10nProjectConfig config,
  ) async {
    final List<FileSystemEntity> items = dir.listSync(
      recursive: false,
      followLinks: false,
    );

    final List<File> allFiles = items.whereType<File>().toList();

    final List<
      ({
        String fileName,
        int placeHoldersCount,
        Map<L10nKey, L10nValue> allKeyValues,
      })
    >
    allArbData = [];

    for (final File file in allFiles) {
      final isArbFile = file.path.endsWith('.arb');

      if (isArbFile) {
        final arbData = _extract(await file.readAsString());
        if (arbData != null) {
          allArbData.add((
            fileName: file.path,
            placeHoldersCount: arbData.placeHoldersCount,
            allKeyValues: arbData.allKeyValues,
          ));
        }
      }
    }
    late ArbFileData mainPreMadeTranslationArb;
    final List<ArbFileData> preMadeTranslationArb = [];
    final Map<L10nKey, BabelFunctionDeclaration> declarationFunctions = {};

    if (allArbData.isNotEmpty) {
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

      final main = allArbData.first;
      final Map<NewL10nKey, NewL10nKey> uniqueness = _garanteeUniquenessOfKeys(
        main.allKeyValues,
      );

      declarationFunctions.addAll(
        _inferDeclarationFunctionFromArbJson(main.allKeyValues),
      );
      final allArbs =
          allArbData.map((arbData) {
            final locale = _extractLocationDataFromArbFileName(
              arbData.fileName,
            );
            return ArbFileData(
              locale: locale,
              allKeyValues: Map.fromEntries(
                arbData.allKeyValues.entries.map((entry) {
                  final newKey = uniqueness[entry.key];
                  if (newKey == null) return null;
                  return MapEntry(newKey, entry.value);
                }).removeNull,
              ),
            );
          }).toList();
      mainPreMadeTranslationArb = allArbs.first;
      // Remove first to not include it in the preMadeTranslationArb
      allArbs.removeAt(0);
      preMadeTranslationArb.addAll(allArbs);
    } else {
      return null;
    }

    return ArbData(
      config: config,
      preMadeTranslationArb: preMadeTranslationArb,
      allDeclarationFunctions: declarationFunctions,
      mainPreMadeTranslationArb: mainPreMadeTranslationArb,
    );
  }

  ({
    int placeHoldersCount,
    Map<L10nKey, L10nValue> allKeyValues,
    // Map<L10nKey, BabelFunctionDeclaration> allDeclarationFunctions,
  })?
  _extract(String jsonContent) {
    if (jsonContent.isEmpty) {
      return null;
    }

    final json = jsonDecode(jsonContent) as Map<String, dynamic>;

    int placeHoldersCount = 0;
    final Map<L10nKey, L10nValue> keyValues = {};

    json.forEach((key, value) {
      final isPlaceHolderKey = key.startsWith('@') == false;
      if (isPlaceHolderKey) {
        keyValues[key] = value;
      } else {
        placeHoldersCount++;
      }
    });

    return (placeHoldersCount: placeHoldersCount, allKeyValues: keyValues);
  }
}

// const List<String> _ignoreArbFileExtension = [
//   'android',
//   'ios',
//   'linux',
//   'macos',
//   'build',
//   'web',
//   'windows',
// ];

class ArbData {
  final L10nProjectConfig config;
  final ArbFileData mainPreMadeTranslationArb;
  final List<ArbFileData> preMadeTranslationArb;
  final Map<L10nKey, BabelFunctionDeclaration> allDeclarationFunctions;

  const ArbData({
    required this.config,
    required this.allDeclarationFunctions,
    required this.mainPreMadeTranslationArb,
    required this.preMadeTranslationArb,
  });
}

class ArbFileData {
  final BabelSupportedLocales locale;
  final Map<L10nKey, L10nValue> allKeyValues;
  const ArbFileData({required this.locale, required this.allKeyValues});
}

Future<String> readFile(String path) async {
  try {
    // Create a File object with the provided path
    final File file = File(path);

    // Read the file content as a string using asynchronous operation
    // Assumes UTF-8 encoding, suitable for Info.plist files
    return await file.readAsString();
  } catch (e) {
    throw Exception('Error reading file: $e');
  }
}
