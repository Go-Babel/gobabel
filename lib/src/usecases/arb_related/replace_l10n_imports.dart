import 'package:gobabel/src/models/l10n_project_config.dart';

/// Removes l10n import statements from file content.
/// Returns a tuple of (modifiedContent, hasChanges).
(String content, bool hasChanges) replaceImportsIfNeeded({
  required String fileContent,
  required L10nProjectConfigWithData projectConfig,
  required String projectName,
}) {
  final importToRemove = projectConfig.getImportString(projectName);
  // Extract the actual file basename (e.g., app_localizations.dart or s.dart)
  final fileBaseName =
      RegExp(r'([^/]+\.dart)$').firstMatch(importToRemove)?.group(1) ??
      // Fallback to a conservative lowercase form (kept for backward tests)
      '${projectConfig.outputClass.toLowerCase()}.dart';

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
    // Relative imports to gen_l10n for the project's outputClass
    // Standard relative import: import '../../gen_l10n/<output>.dart';
    RegExp(
      "^import\\s+['\"]\\.[^'\"]*?/gen_l10n/${RegExp.escape(fileBaseName)}['\"];?.*\$",
      multiLine: true,
    ),
    // Relative import with alias: import '../../gen_l10n/<output>.dart' as alias;
    RegExp(
      "^import\\s+['\"]\\.[^'\"]*?/gen_l10n/${RegExp.escape(fileBaseName)}['\"]\\s+as\\s+\\w+;?.*\$",
      multiLine: true,
    ),
    // Relative import with show/hide: import '../../gen_l10n/<output>.dart' show/hide ...;
    RegExp(
      "^import\\s+['\"]\\.[^'\"]*?/gen_l10n/${RegExp.escape(fileBaseName)}['\"]\\s+(show|hide)\\s+[^;]+;?.*\$",
      multiLine: true,
    ),
    // Also check for flutter_gen imports if switching from synthetic
    if (!projectConfig.syntheticPackage)
      RegExp(
        "^import\\s+['\"]package:flutter_gen/gen_l10n/${RegExp.escape(fileBaseName)}['\"].*\$",
        multiLine: true,
      ),
    // Also check for project package imports if switching to synthetic
    if (projectConfig.syntheticPackage)
      RegExp(
        "^import\\s+['\"]package:$projectName/[^'\"]*/${RegExp.escape(fileBaseName)}['\"].*\$",
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
