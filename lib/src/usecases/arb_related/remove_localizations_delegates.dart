import 'package:gobabel/src/models/l10n_project_config.dart';

/// Extracts the import alias from the file content for the given import string.
/// Returns empty string if no alias is found.
String extractImportAlias({
  required String fileContent,
  required String importString,
}) {
  // Pattern to match import with alias
  final aliasPattern = RegExp(
    "import\\s+['\"]${RegExp.escape(importString)}['\"]\\s+as\\s+(\\w+)",
    multiLine: true,
  );

  final match = aliasPattern.firstMatch(fileContent);
  if (match != null) {
    return match.group(1) ?? '';
  }

  return '';
}

/// Removes localizationsDelegates entries for the project's outputClass.
/// Returns a tuple of (modifiedContent, hasChanges).
(String content, bool hasChanges) removeLocalizationsDelegatesIfNeeded({
  required String fileContent,
  required L10nProjectConfigWithData projectConfig,
  required String projectName,
}) {
  // Quick check if file contains localizationsDelegates
  if (!fileContent.contains('localizationsDelegates')) {
    return (fileContent, false);
  }

  // Get the import string and extract alias if any
  final importString = projectConfig.getImportString(projectName);
  final alias = extractImportAlias(
    fileContent: fileContent,
    importString: importString,
  );

  // Build the delegate reference pattern
  String delegateReference;
  if (alias.isNotEmpty) {
    // With alias: alias.OutputClass.delegate or alias.OutputClass.localizationsDelegates
    delegateReference =
        RegExp.escape(alias) +
        r'\.' +
        RegExp.escape(projectConfig.outputClass) +
        r'\.(localizationsDelegates|delegates?)';
  } else {
    // Without alias: OutputClass.delegate or OutputClass.localizationsDelegates
    // Make sure it's not prefixed by another identifier (negative lookbehind)
    delegateReference =
        r'(?<![a-zA-Z_]\.)' +
        RegExp.escape(projectConfig.outputClass) +
        r'\.(localizationsDelegates|delegates?)';
  }

  // Use regex-based approach directly as it's more reliable
  return _removeWithRegex(
    fileContent: fileContent,
    delegateReference: delegateReference,
    projectConfig: projectConfig,
  );
}

/// Regex-based approach for removing delegates
(String content, bool hasChanges) _removeWithRegex({
  required String fileContent,
  required String delegateReference,
  required L10nProjectConfigWithData projectConfig,
}) {
  String result = fileContent;
  bool hasChanges = false;

  // Pattern for spread operator with delegates including comma and whitespace
  final spreadPattern = RegExp(
    r'\.\.\.(' + delegateReference + r')(\s*,)?(\s*\n)?',
    multiLine: true,
  );

  // Pattern for direct reference including comma and whitespace
  final directPattern = RegExp(
    r'(' + delegateReference + r')(\s*,)?(\s*\n)?',
    multiLine: true,
  );

  // First handle spread operator references
  if (spreadPattern.hasMatch(result)) {
    result = result.replaceAllMapped(spreadPattern, (match) {
      hasChanges = true;
      // Keep newline if it exists to preserve formatting
      return match.group(3) ?? '';
    });
  }

  // Then handle direct references (but not those that are part of spread)
  if (!delegateReference.contains('...') && directPattern.hasMatch(result)) {
    result = result.replaceAllMapped(directPattern, (match) {
      // Check this isn't part of a spread operator we missed
      final fullMatch = match.group(0)!;
      final startIndex = match.start;
      if (startIndex >= 3 &&
          result.substring(startIndex - 3, startIndex) == '...') {
        return fullMatch; // Don't remove, it's part of spread
      }
      hasChanges = true;
      // Keep newline if it exists
      return match.group(3) ?? '';
    });
  }

  if (hasChanges) {
    result = _cleanupEmptyArraysAndCommas(result);
  }

  return (result, hasChanges);
}

/// Cleans up empty arrays and trailing commas after removal
String _cleanupEmptyArraysAndCommas(String content) {
  // Remove empty arrays (property becomes unnecessary if nothing remains)
  content = content.replaceAll(
    RegExp(r'localizationsDelegates\s*:\s*\[\s*\]'),
    '',
  );
  content = content.replaceAll(
    RegExp(r'localizationsDelegates\s*:\s*const\s*\[\s*\]'),
    '',
  );

  // Fix a dangling comma that could appear at the start of the first remaining line
  // inside the localizationsDelegates list after removing the first element.
  // Example to fix:
  // localizationsDelegates: [\n
  //   ,        ...report_generator.S.localizationsDelegates,
  // becomes
  // localizationsDelegates: [\n
  //           ...report_generator.S.localizationsDelegates,
  content = content.replaceAllMapped(
    RegExp(
      r'(localizationsDelegates\s*:\s*(?:const\s*)?\[\s*\n)([ \t]*)\,([ \t]*)',
      multiLine: true,
    ),
    (m) => (m.group(1) ?? '') + (m.group(2) ?? ''),
  );

  return content;
}
