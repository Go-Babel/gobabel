import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:meta/meta.dart';
import 'package:result_dart/result_dart.dart';
import 'package:path/path.dart' as path;

AsyncBabelResult<Unit>
multiFileRemoveConstOfConstructorsWithDefaultStringInParameter({
  required List<File> targetFiles,
}) async {
  final totalFiles = targetFiles.length;
  var processedFiles = 0;

  // Process files in batches to allow event loop to update UI
  const batchSize = 5;

  for (var i = 0; i < targetFiles.length; i += batchSize) {
    final endIndex =
        (i + batchSize > targetFiles.length)
            ? targetFiles.length
            : i + batchSize;
    final batch = targetFiles.sublist(i, endIndex);

    // Process batch of files
    for (final file in batch) {
      try {
        final source = await file.readAsString();
        final transformed =
            singleFileRemoveConstOfConstructorsWithDefaultStringInParameter(
              source,
            );
        if (transformed != source) {
          await file.writeAsString(transformed);
        }
        processedFiles++;

        // Update progress
        if (totalFiles > 0) {
          LoadingIndicator.instance.setLoadingProgressBar(
            message:
                'Processing file $processedFiles/$totalFiles: ${path.basename(file.path)}',
            barProgressInfo: BarProgressInfo(
              message:
                  'Removing const from constructors with default string parameters',
              totalSteps: totalFiles,
              currentStep: processedFiles,
            ),
          );
        }
      } catch (e) {
        // Log error but continue with other files
        print('Error processing file ${file.path}: $e');
      }
    }

    // Yield to event loop to allow UI updates
    await Future.delayed(Duration.zero);
  }

  return Success(unit);
}

@visibleForTesting
String singleFileRemoveConstOfConstructorsWithDefaultStringInParameter(
  String dartFileContent,
) {
  try {
    // Step 1: Parse Dart file to AST
    final parseResult = parseString(content: dartFileContent);

    // If there are parse errors, return the original content
    if (parseResult.errors.isNotEmpty) {
      return dartFileContent;
    }

    // Step 2: Collect all hardcoded strings with their positions
    final stringCollector = _HardcodedStringCollector();
    parseResult.unit.accept(stringCollector);

    // Step 3: Find const constructors and check for overlap with hardcoded strings
    final constructorVisitor = _ConstConstructorVisitor(
      stringCollector.hardcodedStrings,
    );
    parseResult.unit.accept(constructorVisitor);

    if (constructorVisitor.constKeywordsToRemove.isEmpty) {
      return dartFileContent; // No modifications needed
    }

    // Step 4: Apply edits from end to start to preserve indices
    return _applyEdits(
      dartFileContent,
      constructorVisitor.constKeywordsToRemove,
    );
  } catch (e) {
    // If any error occurs, return the original content
    return dartFileContent;
  }
}

/// Visitor that collects all hardcoded strings with their positions
class _HardcodedStringCollector extends RecursiveAstVisitor<void> {
  final List<_PositionRange> hardcodedStrings = [];

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    if (_isHardcodedString(node)) {
      hardcodedStrings.add(_PositionRange(start: node.offset, end: node.end));
    }
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    // For string interpolations, we might consider them as hardcoded if they
    // contain user-facing text. For now, we'll skip them.
    super.visitStringInterpolation(node);
  }

  /// Determines if a string literal is a "hardcoded" user-facing string
  /// vs a configuration string or identifier
  bool _isHardcodedString(StringLiteral stringLiteral) {
    final value = stringLiteral.stringValue;

    if (value == null || value.isEmpty) return false;

    // Skip very short strings (likely configuration)
    if (value.length < 2) return false;

    // Skip strings that look like identifiers or keys
    if (RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]*$').hasMatch(value)) {
      return false;
    }

    // Skip URLs, file paths, or technical strings
    if (value.startsWith('http') ||
        value.startsWith('/') ||
        value.startsWith('assets/') ||
        value.contains('://')) {
      return false;
    }

    // Consider strings with spaces or punctuation as user-facing
    return value.contains(' ') ||
        value.contains('.') ||
        value.contains('!') ||
        value.contains('?') ||
        value.length > 10; // Longer strings likely user-facing
  }
}

/// AST visitor that finds const constructors with hardcoded strings in parameters
class _ConstConstructorVisitor extends RecursiveAstVisitor<void> {
  final List<_PositionRange> hardcodedStrings;
  final List<_ConstKeywordInfo> constKeywordsToRemove = [];

  _ConstConstructorVisitor(this.hardcodedStrings);

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    // Check if it's a const constructor
    final constKeyword = node.constKeyword;
    final parameters = node.parameters;

    if (constKeyword != null) {
      // Get the parameter list range
      final paramStart = parameters.offset;
      final paramEnd = parameters.end;

      // Check if any hardcoded string falls within the parameter range
      final hasHardcodedStringInParams = hardcodedStrings.any(
        (stringPos) =>
            stringPos.start >= paramStart && stringPos.end <= paramEnd,
      );

      // Also check initializer list if it exists
      bool hasHardcodedStringInInitializers = false;
      if (node.initializers.isNotEmpty) {
        final initStart = node.initializers.first.offset;
        final initEnd = node.initializers.last.end;

        hasHardcodedStringInInitializers = hardcodedStrings.any(
          (stringPos) =>
              stringPos.start >= initStart && stringPos.end <= initEnd,
        );
      }

      if (hasHardcodedStringInParams || hasHardcodedStringInInitializers) {
        constKeywordsToRemove.add(
          _ConstKeywordInfo(start: constKeyword.offset, end: constKeyword.end),
        );
      }
    }
    super.visitConstructorDeclaration(node);
  }
}

class _PositionRange {
  final int start;
  final int end;

  _PositionRange({required this.start, required this.end});
}

class _ConstKeywordInfo {
  final int start;
  final int end;

  _ConstKeywordInfo({required this.start, required this.end});
}

/// Applies edits to remove const keywords, processing from end to start
String _applyEdits(String content, List<_ConstKeywordInfo> edits) {
  // Sort by start position in descending order (end to start)
  edits.sort((a, b) => b.start.compareTo(a.start));

  String result = content;

  for (final edit in edits) {
    // Find the space after 'const' to remove it too
    int endPos = edit.end;
    if (endPos < result.length && result[endPos] == ' ') {
      endPos++; // Include the space
    }

    result = result.replaceRange(edit.start, endPos, '');
  }

  return result;
}

AsyncBabelResult<GenerateFlowRemovedConstFromConstructorsWithStringParams>
generate_multiFileRemoveConstOfConstructorsWithDefaultStringInParameter(
  GenerateFlowRemovedConstFromCollectionsWithStrings payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result =
      await multiFileRemoveConstOfConstructorsWithDefaultStringInParameter(
        targetFiles: targetFiles,
      );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowRemovedConstFromConstructorsWithStringParams(
    willLog: payload.willLog,
    projectApiToken: payload.projectApiToken,
    directoryPath: payload.directoryPath,
    inputedByUserLocale: payload.inputedByUserLocale,
    dangerouslyAutoDetectUserFacingHardcodedStrings:
        payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
    dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing:
        payload.dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing,
    runForAllFiles: payload.runForAllFiles,
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
  ).toSuccess();
}
