import 'dart:io';
import 'package:console_bars/console_bars.dart';
import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:enchanted_regex/enchanted_regex.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/gobabel_controller.dart';
import 'package:gobabel/src/scripts/arb_migration_related/ensure_integrity_of_arb.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/arb_migration_related/set_declaration_function.dart';
import 'package:gobabel_core/gobabel_core.dart';

class ResolveAllArbKeysUsecase {
  final SetDeclarationFunctionUsecase _setDeclarationFunctionUsecase;
  final EnsureIntegrityOfArbUsecase _ensureIntegrityOfArbUsecase;
  const ResolveAllArbKeysUsecase({
    required EnsureIntegrityOfArbUsecase ensureIntegrityOfArbUsecase,
    required SetDeclarationFunctionUsecase setDeclarationFunctionUsecase,
  }) : _ensureIntegrityOfArbUsecase = ensureIntegrityOfArbUsecase,
       _setDeclarationFunctionUsecase = setDeclarationFunctionUsecase;

  Future<void> call() async {
    final ArbData? arbData = Dependencies.arbData;
    if (arbData == null) return;

    _setDeclarationFunctionUsecase();

    // Will throw an exception if the arb files are not consistent
    _ensureIntegrityOfArbUsecase(arbData);

    final String arbKeyRegexIdentifier = Dependencies.arbKeyRegexIdentifier;

    final List<File> files = await Dependencies.filesToBeAnalysed;

    final FillingBar? p =
        isInTest
            ? null
            : FillingBar(
              desc: 'Replacing Arb output class to BabelText...',
              total: files.length,
              time: true,
              percentage: true,
            );

    final Set<L10nKey> allKeys =
        arbData.preMadeTranslationArb
            .expand((arb) => arb.allKeyValues.keys)
            .toSet();

    final keysCluster = allKeys.splitIntoGroups(100);
    for (final File file in files) {
      p?.increment();
      final String fileName = file.path;
      String fileContent = await file.readAsString();

      // Let's do it in groups of 100 to not overwhelm the regex engine
      bool hasChanges = false;
      for (final List<L10nKey> keys in keysCluster) {
        final regex = RegExp(
          '$arbKeyRegexIdentifier(${keys.join('|')})',
          multiLine: true,
        );

        fileContent = fileContent.replaceAllMapped(regex, (Match match) {
          hasChanges = true;
          final String matchedKey = match.group(1)!;
          final String keyName = match.group(2)!;

          Dependencies.addLabelContextPath(keyName, fileName);
          return match.text.replaceAll(matchedKey, 'BabelText');
        });
      }

      if (hasChanges) {
        await file.writeAsString(fileContent);
      }
    }
  }
}
