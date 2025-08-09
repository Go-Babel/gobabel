import 'package:gobabel/src/models/l10n_project_config.dart';

/// Removes l10n import statements from file content.
/// Returns a tuple of (modifiedContent, hasChanges).
(String content, bool hasChanges) replaceImportsIfNeeded({
  required String fileContent,
  required L10nProjectConfigWithData projectConfig,
  required String projectName,
}) {
  final importToRemove = projectConfig.getImportString(projectName);

  // Create regex patterns to match different import styles
  // This matches imports with or without aliases (as, show, hide)
  final patterns = [
    // Standard import: import 'package:...'
    RegExp(
      "^import\\s+['\"]${RegExp.escape(importToRemove)}['\"];?.*\$",
      multiLine: true,
    ),
    // Import with alias: import 'package:...' as alias;
    RegExp(
      "^import\\s+['\"]${RegExp.escape(importToRemove)}['\"]\\s+as\\s+\\w+;?.*\$",
      multiLine: true,
    ),
    // Import with show/hide: import 'package:...' show/hide ...;
    RegExp(
      "^import\\s+['\"]${RegExp.escape(importToRemove)}['\"]\\s+(show|hide)\\s+[^;]+;?.*\$",
      multiLine: true,
    ),
    // Also check for flutter_gen imports if switching from synthetic
    if (!projectConfig.syntheticPackage)
      RegExp(
        "^import\\s+['\"]package:flutter_gen/gen_l10n/${projectConfig.outputClass.toLowerCase()}\\.dart['\"].*\$",
        multiLine: true,
      ),
    // Also check for project package imports if switching to synthetic
    if (projectConfig.syntheticPackage)
      RegExp(
        "^import\\s+['\"]package:$projectName/[^'\"]*/${projectConfig.outputClass.toLowerCase()}\\.dart['\"].*\$",
        multiLine: true,
      ),
  ];

  bool hasChanges = false;
  String result = fileContent;

  for (final pattern in patterns) {
    if (pattern.hasMatch(result)) {
      hasChanges = true;
      // Replace the entire line including the newline character
      result = result.replaceAll(pattern, '');
    }
  }

  return (result, hasChanges);
}
