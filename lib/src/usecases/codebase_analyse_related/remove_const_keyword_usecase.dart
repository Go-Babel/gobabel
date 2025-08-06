import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:meta/meta.dart';
import 'package:result_dart/result_dart.dart';
import 'package:path/path.dart' as path;

AsyncBabelResult<Unit>
multiRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy({
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
            singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
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
              message: 'Removing const from structures with hardcoded strings',
              totalSteps: totalFiles,
              currentStep: processedFiles,
            ),
          );
        }
      } catch (e) {
        // Log error but continue with other files
        ConsoleManager.instance.error('Error processing file ${file.path}: $e');
      }
    }

    // Yield to event loop to allow UI updates
    await Future.delayed(Duration.zero);
  }

  return Success(unit);
}

/// Will seek for all hardcoded strings and when It finds a hardcoded string it will check
/// the hierarchy of the classes above it that contain this hardcoded string and remove any `const` keyword.
String singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
  String dartFileContent,
) {
  try {
    // Step 1: Parse Dart file to AST
    final parseResult = parseString(
      content: dartFileContent,
      featureSet: FeatureSet.latestLanguageVersion(),
      throwIfDiagnostics: false,
    );

    // If there are parse errors, return the original content
    if (parseResult.errors.isNotEmpty) {
      return dartFileContent;
    }

    // Step 2: Find const keywords that can be removed
    return removeConsts(dartFileContent);
  } catch (e) {
    // If any error occurs, return the original content
    return dartFileContent;
  }
}

@visibleForTesting
String removeConsts(String source) {
  final parseResult = parseString(
    content: source,
    featureSet: FeatureSet.latestLanguageVersion(),
    throwIfDiagnostics: false,
  );

  if (parseResult.errors.isNotEmpty) {
    return source;
  }

  final visitor = _ConstRemovalVisitor(source);
  parseResult.unit.accept(visitor);

  return visitor.getTransformedSource();
}

class _ConstRemovalVisitor extends RecursiveAstVisitor<void> {
  final String _source;
  final Set<Token> _constTokensToRemove = {};

  _ConstRemovalVisitor(this._source);

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    // Found a hardcoded string, now traverse up to find const keywords
    _findAndMarkConstKeywordsInHierarchy(node);
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    // String interpolations might contain hardcoded parts
    // Check if it has any literal elements
    for (final element in node.elements) {
      if (element is InterpolationString && element.value.isNotEmpty) {
        _findAndMarkConstKeywordsInHierarchy(node);
        break;
      }
    }
    super.visitStringInterpolation(node);
  }

  void _findAndMarkConstKeywordsInHierarchy(AstNode node) {
    AstNode? current = node.parent;

    while (current != null) {
      // Check if this node has a const keyword
      if (current is InstanceCreationExpression &&
          current.keyword?.lexeme == 'const') {
        _constTokensToRemove.add(current.keyword!);
      } else if (current is ConstructorDeclaration &&
          current.constKeyword != null) {
        // Don't remove const from constructor declarations
        // Based on tests, we should keep const constructors
      }
      // Note: We deliberately don't remove const from VariableDeclarationList
      // because const variables should remain const even if they contain strings

      current = current.parent;
    }
  }

  String getTransformedSource() {
    if (_constTokensToRemove.isEmpty) {
      return _source;
    }

    // Sort tokens by offset in descending order
    final sortedTokens =
        _constTokensToRemove.toList()
          ..sort((a, b) => b.offset.compareTo(a.offset));

    String result = _source;
    for (final token in sortedTokens) {
      // Remove the const keyword and any trailing space
      final start = token.offset;
      var end = token.end;

      // Check if there's a space after const
      if (end < result.length && result[end] == ' ') {
        end++;
      }

      result = result.replaceRange(start, end, '');
    }

    return result;
  }
}

AsyncBabelResult<GenerateFlowRemovedConstFromStructuresWithStrings>
generate_multiRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
  GenerateFlowRemovedConstFromConstructorsWithStringParams payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result =
      await multiRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
        targetFiles: targetFiles,
      );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowRemovedConstFromStructuresWithStrings(
    willLog: payload.willLog,
    projectApiToken: payload.projectApiToken,
    directoryPath: payload.directoryPath,
    inputedByUserLocale: payload.inputedByUserLocale,
    dangerouslyAutoDetectUserFacingHardcodedStrings:
        payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
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
