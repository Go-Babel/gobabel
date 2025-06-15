import 'dart:io';

import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:enchanted_regex/enchanted_regex.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<TranslationPayloadInfo>
replaceAllL10nKeyReferencesInCodebaseForBabelFunctions({
  required L10nProjectConfig projectConfig,
  required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
  required List<File> targetFiles,
  required TranslationPayloadInfo currentPayloadInfo,
}) async {
  final L10nProjectConfigWithData? projectConfigWithData = projectConfig
      .mapOrNull(withData: (value) => value);
  if (projectConfigWithData == null) {
    return currentPayloadInfo.toSuccess();
  }

  final Map<TranslationKey, Set<ContextPath>> keyToContextsPaths = {
    ...currentPayloadInfo.keyToContextsPaths,
  };
  final String outputClass = projectConfigWithData.outputClass;
  final String baseRegexIdentifier =
      '($outputClass)'
      // S\s*\.(?:[a-zA-Z0.9()!]|\s)+\.\s*duels
      r'\s*\.(?:[a-zA-Z0.9()!]|\s)+\.\s*';

  final List<TranslationKey> allKeys = remapedArbKeys.keys.toList();

  // The keys are split into groups of 100 to not overwhelm the regex engine
  final keysCluster = allKeys.splitIntoGroups(100);

  for (final file in targetFiles) {
    String fileContent = await file.readAsString();
    bool hasChanges = false;
    for (final keys in keysCluster) {
      final String fileName = file.path;
      final regex = RegExp(
        '$baseRegexIdentifier(${keys.join('|')})',
        multiLine: true,
      );

      fileContent = fileContent.replaceAllMapped(regex, (Match match) {
        hasChanges = true;
        final String matchedKey = match.group(1)!;
        final String keyName = match.group(2)!;
        final ProcessedKeyIntegrity integrityKey = remapedArbKeys[keyName]!;
        if (!keyToContextsPaths.containsKey(integrityKey)) {
          keyToContextsPaths[integrityKey] = <ContextPath>{};
        }
        keyToContextsPaths[integrityKey]!.add(fileName);
        return match //
            .text
            .replaceFirst(matchedKey, 'BabelText')
            .replaceFirst(keyName, integrityKey);
      });
    }
    if (hasChanges) {
      await file.writeAsString(fileContent);
    }
  }

  return currentPayloadInfo
      .copyWith(keyToContextsPaths: keyToContextsPaths)
      .toSuccess();
}
