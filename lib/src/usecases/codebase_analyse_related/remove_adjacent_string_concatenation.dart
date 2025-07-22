import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> multiRemoveAdjacentStringLiteralConcatenationUsecase({
  required List<File> targetFiles,
}) async {
  for (final file in targetFiles) {
    final source = await file.readAsString();
    final transformed = singleRemoveAdjacentStringLiteralConcatenationUsecase(
      source,
    );
    if (transformed != source) {
      await file.writeAsString(transformed);
    }
  }

  return Success(unit);
}

/// Removes adjacent string literal concatenation from Dart code
///
/// Example:
/// ```dart
/// Text('Hello ' 'world!')
/// ```
/// becomes:
/// ```dart
/// Text('Hello world!')
/// ```
String singleRemoveAdjacentStringLiteralConcatenationUsecase(String source) {
  final parseResult = parseString(
    content: source,
    featureSet: FeatureSet.latestLanguageVersion(),
    throwIfDiagnostics: false,
  );

  if (parseResult.errors.isNotEmpty) {
    // If there are parse errors, return the original source
    return source;
  }

  final visitor = _StringConcatenationTransformer(source);
  parseResult.unit.accept(visitor);

  return visitor.getTransformedSource();
}

class _StringConcatenationTransformer extends RecursiveAstVisitor<void> {
  final String _source;
  final List<_StringConcatenationReplacement> _replacements = [];

  _StringConcatenationTransformer(this._source);

  @override
  void visitAdjacentStrings(AdjacentStrings node) {
    // Combine all string literals into one
    final combinedValue = node.strings
        .map((stringLiteral) => _getStringValue(stringLiteral))
        .join('');

    // Determine quote style from the first string
    final firstString = node.strings.first;
    var quoteStyle = _getQuoteStyle(firstString);
    final isRaw = _isRawString(firstString);

    // For raw strings, choose appropriate quote style based on content
    if (isRaw && !quoteStyle.contains('"""') && !quoteStyle.contains("'''")) {
      // For single-character quotes in raw strings, pick quote style that doesn't conflict with content
      if (combinedValue.contains('"') && !combinedValue.contains("'")) {
        quoteStyle = "'";
      } else if (combinedValue.contains("'") && !combinedValue.contains('"')) {
        quoteStyle = '"';
      } else if (combinedValue.contains('"') && combinedValue.contains("'")) {
        // If both quotes are present, use triple quotes
        quoteStyle = '"""';
      }
    }

    // Create the replacement string
    final prefix = isRaw ? 'r' : '';
    final replacement = '$prefix$quoteStyle$combinedValue$quoteStyle';

    _replacements.add(
      _StringConcatenationReplacement(
        start: node.offset,
        end: node.end,
        replacement: replacement,
      ),
    );

    super.visitAdjacentStrings(node);
  }

  String _getStringValue(StringLiteral stringLiteral) {
    // Get the raw string content from source, excluding the quotes
    final sourceText = _source.substring(
      stringLiteral.offset,
      stringLiteral.end,
    );

    if (stringLiteral is SimpleStringLiteral) {
      // For simple strings, extract content between quotes
      return _extractStringContent(sourceText);
    } else if (stringLiteral is StringInterpolation) {
      // For interpolated strings, extract content between quotes
      return _extractStringContent(sourceText);
    }
    return '';
  }

  String _extractStringContent(String sourceText) {
    // Handle raw strings
    if (sourceText.startsWith('r"') || sourceText.startsWith("r'")) {
      return sourceText.substring(2, sourceText.length - 1);
    }

    // Handle triple quotes
    if (sourceText.startsWith('"""')) {
      return sourceText.substring(3, sourceText.length - 3);
    }
    if (sourceText.startsWith("'''")) {
      return sourceText.substring(3, sourceText.length - 3);
    }

    // Handle single/double quotes
    if (sourceText.startsWith('"')) {
      return sourceText.substring(1, sourceText.length - 1);
    }
    if (sourceText.startsWith("'")) {
      return sourceText.substring(1, sourceText.length - 1);
    }

    return sourceText;
  }

  String _getQuoteStyle(StringLiteral stringLiteral) {
    final text = _source.substring(stringLiteral.offset, stringLiteral.end);

    // Check for raw strings first
    if (text.startsWith('r"""') || text.startsWith("r'''")) {
      return text.startsWith('r"""') ? '"""' : "'''";
    }

    // Check for triple quotes
    if (text.startsWith('"""')) {
      return '"""';
    }
    if (text.startsWith("'''")) {
      return "'''";
    }

    // Check for single quotes (but not raw single quotes which are handled above)
    if (text.startsWith("'") && !text.startsWith("r'")) {
      return "'";
    }

    // Default to double quotes for regular strings and raw double quotes
    return '"';
  }

  bool _isRawString(StringLiteral stringLiteral) {
    final text = _source.substring(stringLiteral.offset, stringLiteral.end);
    return text.startsWith('r"') ||
        text.startsWith("r'") ||
        text.startsWith('r"""') ||
        text.startsWith("r'''");
  }

  String getTransformedSource() {
    if (_replacements.isEmpty) {
      return _source;
    }

    // Sort replacements by start position in descending order
    // so we can replace from end to beginning without affecting positions
    _replacements.sort((a, b) => b.start.compareTo(a.start));

    String result = _source;
    for (final replacement in _replacements) {
      result = result.replaceRange(
        replacement.start,
        replacement.end,
        replacement.replacement,
      );
    }

    return result;
  }
}

class _StringConcatenationReplacement {
  final int start;
  final int end;
  final String replacement;

  _StringConcatenationReplacement({
    required this.start,
    required this.end,
    required this.replacement,
  });
}

AsyncBabelResult<GenerateFlowRemovedAdjacentStringConcatenation>
generate_multiRemoveAdjacentStringLiteralConcatenationUsecase(
  GenerateFlowResolvedProjectArbTranslationPayload payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result = await multiRemoveAdjacentStringLiteralConcatenationUsecase(
    targetFiles: targetFiles,
  );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowRemovedAdjacentStringConcatenation(
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
