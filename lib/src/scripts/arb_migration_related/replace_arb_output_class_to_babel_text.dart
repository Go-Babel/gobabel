import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:enchanted_regex/enchanted_regex.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel_core/go_babel_core.dart';

class ReplaceArbOutputClassToBabelTextUsecase {
  /// Will replace all the occurrences of the class `ArbOutput` to `BabelText`
  FileContent call({
    required String fileName,
    required FileContent fileContent,
  }) {
    final ArbData? arbData = Dependencies.arbData;
    final String arbKeyRegexIdentifier = Dependencies.arbKeyRegexIdentifier;
    if (arbData == null) return fileContent;

    String newContent = fileContent;

    final Map<L10nKey, BabelFunctionDeclaration> allDeclarationFunctions =
        arbData.allDeclarationFunctions;

    // Let's do it in groups of 100 to not overwhelm the regex engine
    final keysCluster = allDeclarationFunctions.keys.splitIntoGroups(100);
    for (final List<L10nKey> keys in keysCluster) {
      final regex = RegExp(
        '$arbKeyRegexIdentifier(${keys.join('|')})',
        multiLine: true,
      );

      newContent = newContent.replaceAllMapped(regex, (Match match) {
        // final matchText = match.text;
        // print(matchText);
        final String matchedKey = match.group(1)!;
        final String keyName = match.group(2)!;

        Dependencies.addLabelContextPath(keyName, fileName);
        return match.text.replaceAll(matchedKey, 'BabelText');
      });
    }

    return newContent;
  }
}
