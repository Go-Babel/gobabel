import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel/src/usecases/key_integrity/generate_log_if_requested.dart';
import 'package:gobabel_core/gobabel_core.dart';

/// Result of replacing L10n references with Babel implementations
class ReplacementResult {
  final String content;
  final bool hasChanges;

  const ReplacementResult({required this.content, required this.hasChanges});
}

/// Replaces all L10n references with Babel class and implementations
/// Returns a ReplacementResult with the modified content and whether changes were made
ReplacementResult replaceL10nReferencesWithBabel({
  required String fileContent,
  required String outputClass,
  required List<List<L10nKey>> clusteredRemapedArbs,
  required Map<L10nKey, ProcessedKeyIntegrity> remapedArbKeys,
  required Map<TranslationKey, Set<VariableName>> variablesPlaceholdersPerKey,
}) {
  String content = fileContent;
  bool hasChanges = false;

  // Replace outputClass patterns with Babel class
  final defaultPattern =
      '$outputClass'
      r'\s*\.of\(\s*(?:[a-zA-Z]|\r|\n|\t|\f|\v)+\s*,?\s*\)\s*!?';
  final directDelegate =
      '$outputClass'
      r'\s*.of\(\s*(?:[a-zA-Z])+,\s*S\s*,?\s*\)\s*!?';

  // Process each group of remapped ARB keys
  for (final group in clusteredRemapedArbs) {
    String variableNamesIdentifiers = '';

    // Build regex pattern for all keys in this group
    for (final L10nKey originalKey in group) {
      variableNamesIdentifiers = variableNamesIdentifiers.isEmpty
          ? originalKey
          : '$variableNamesIdentifiers|$originalKey';
    }

    final regex =
        '(?:$defaultPattern|$directDelegate)'
        r'\s*\.\s*'
        '($variableNamesIdentifiers)'
        r'\b';

    final groupRegex = RegExp(regex, multiLine: true);

    content = content.replaceAllMapped(groupRegex, (match) {
      hasChanges = true;
      final L10nKey? originalKey = match.group(1);
      if (originalKey == null) {
        logMessages.add(
          '''No original key found for "$regex" in match: $match''',
        );
        return match.group(0) ?? '';
      }

      final placeHolders = variablesPlaceholdersPerKey[originalKey];
      final bool havePlaceHolders =
          placeHolders != null && placeHolders.isNotEmpty;

      final ProcessedKeyIntegrity newProcessedKey =
          remapedArbKeys[originalKey]!;
      final String suffix = havePlaceHolders ? '' : '()';

      return '$kBabelClass.$newProcessedKey$suffix';
    });
  }

  final regex = RegExp('($defaultPattern|$directDelegate)', multiLine: true);

  content = content.replaceAllMapped(regex, (match) {
    hasChanges = true;
    return kBabelClass;
  });

  return ReplacementResult(content: content, hasChanges: hasChanges);
}
