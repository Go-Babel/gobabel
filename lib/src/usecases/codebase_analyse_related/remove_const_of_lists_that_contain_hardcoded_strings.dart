import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit>
multiRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside({
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
            singleRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
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
                'Processing file $processedFiles/$totalFiles: ${file.path.split('/').last}',
            barProgressInfo: BarProgressInfo(
              message:
                  'Removing const from lists/sets/maps with hardcoded strings',
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

String singleRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
  String dartFileContent,
) {
  try {
    // Step 1: Parse Dart file to AST
    final parseResult = parseString(content: dartFileContent);

    // If there are parse errors, return the original content
    if (parseResult.errors.isNotEmpty) {
      return dartFileContent;
    }

    // Step 2: Find const collections containing hardcoded strings
    final visitor = _ConstCollectionVisitor();
    parseResult.unit.accept(visitor);

    if (visitor.constKeywordsToRemove.isEmpty) {
      return dartFileContent; // No modifications needed
    }

    // Step 3: Apply edits from end to start to preserve indices
    return _applyEdits(dartFileContent, visitor.constKeywordsToRemove);
  } catch (e) {
    // If any error occurs, return the original content
    return dartFileContent;
  }
}

/// AST visitor that finds const collections containing hardcoded strings
class _ConstCollectionVisitor extends RecursiveAstVisitor<void> {
  final List<_ConstKeywordInfo> constKeywordsToRemove = [];

  @override
  void visitListLiteral(ListLiteral node) {
    _checkConstCollection(node, node.constKeyword, node.elements);
    super.visitListLiteral(node);
  }

  @override
  void visitSetOrMapLiteral(SetOrMapLiteral node) {
    _checkConstCollection(node, node.constKeyword, node.elements);
    super.visitSetOrMapLiteral(node);
  }

  void _checkConstCollection(
    AstNode node,
    dynamic constKeyword,
    NodeList<CollectionElement> elements,
  ) {
    if (constKeyword == null) return; // Not a const collection

    // Check if collection contains hardcoded strings
    if (_containsHardcodedStrings(elements)) {
      constKeywordsToRemove.add(
        _ConstKeywordInfo(start: constKeyword.offset, end: constKeyword.end),
      );
    }
  }

  /// Recursively checks if collection elements contain hardcoded strings
  bool _containsHardcodedStrings(NodeList<CollectionElement> elements) {
    for (final element in elements) {
      if (_elementContainsStrings(element)) {
        return true;
      }
    }
    return false;
  }

  bool _elementContainsStrings(CollectionElement element) {
    // Direct string literal
    if (element is StringLiteral) {
      return _isHardcodedString(element);
    }

    // Expression containing string
    if (element is Expression) {
      return _expressionContainsStrings(element);
    }

    // Map entry (for maps)
    if (element is MapLiteralEntry) {
      return _expressionContainsStrings(element.key) ||
          _expressionContainsStrings(element.value);
    }

    // Spread elements (...list)
    if (element is SpreadElement) {
      return _expressionContainsStrings(element.expression);
    }

    // If/for elements in collections
    if (element is IfElement) {
      return _elementContainsStrings(element.thenElement) ||
          (element.elseElement != null &&
              _elementContainsStrings(element.elseElement!));
    }

    if (element is ForElement) {
      return _elementContainsStrings(element.body);
    }

    return false;
  }

  bool _expressionContainsStrings(Expression expression) {
    // Direct string literal
    if (expression is StringLiteral) {
      return _isHardcodedString(expression);
    }

    // Method/constructor calls that might contain strings
    if (expression is MethodInvocation ||
        expression is InstanceCreationExpression) {
      return _hasStringArguments(expression);
    }

    // Nested collections
    if (expression is ListLiteral) {
      return _containsHardcodedStrings(expression.elements);
    }

    if (expression is SetOrMapLiteral) {
      return _containsHardcodedStrings(expression.elements);
    }

    return false;
  }

  bool _hasStringArguments(Expression expression) {
    ArgumentList? arguments;

    if (expression is MethodInvocation) {
      arguments = expression.argumentList;
    } else if (expression is InstanceCreationExpression) {
      arguments = expression.argumentList;
    }

    if (arguments == null) return false;

    for (final arg in arguments.arguments) {
      // Check positional arguments
      if (arg is StringLiteral && _isHardcodedString(arg)) {
        return true;
      }

      // Check named arguments
      if (arg is NamedExpression) {
        final expression = arg.expression;
        if (expression is StringLiteral && _isHardcodedString(expression)) {
          return true;
        }
      }
    }

    return false;
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

AsyncBabelResult<GenerateFlowRemovedConstFromCollectionsWithStrings>
generate_multiRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
  GenerateFlowMovedHardcodedStringParams payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result =
      await multiRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
        targetFiles: targetFiles,
      );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowRemovedConstFromCollectionsWithStrings(
    willLog: payload.willLog,
    projectApiToken: payload.projectApiToken,
    directoryPath: payload.directoryPath,
    inputedByUserLocale: payload.inputedByUserLocale,
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
