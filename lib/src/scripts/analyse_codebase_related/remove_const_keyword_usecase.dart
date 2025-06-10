import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:meta/meta.dart';
import 'package:gobabel/src/core/dependencies.dart';

class RemoveConstKeywordUsecase {
  Future<void> call() async {
    final List<File> files = await Dependencies.filesToBeAnalysed;
    if (files.isEmpty) return;

    for (final file in files) {
      final source = await file.readAsString();
      final transformed = removeConsts(source);
      if (transformed != source) {
        await file.writeAsString(transformed);
      }
    }
  }

  @visibleForTesting
  String removeConsts(String source) {
    final parseResult = parseString(
      content: source,
      featureSet: FeatureSet.latestLanguageVersion(),
      throwIfDiagnostics: false,
    );

    Token? token = parseResult.unit.beginToken;
    final ranges = <_Range>[];

    while (token != null && token.type != TokenType.EOF) {
      if (token.lexeme == 'const') {
        // Check if this const is followed by a constructor call
        // Skip whitespace and comments to find the next meaningful token
        Token? nextToken = token.next;
        while (nextToken != null &&
            (nextToken.type == TokenType.SINGLE_LINE_COMMENT ||
                nextToken.type == TokenType.MULTI_LINE_COMMENT ||
                nextToken.lexeme.trim().isEmpty)) {
          nextToken = nextToken.next;
        }

        if (nextToken != null && _isConstructorCall(nextToken, source)) {
          ranges.add(_Range(start: token.offset, end: token.end));
        }
      }
      token = token.next;
    }

    var result = source;
    for (final range in ranges.reversed) {
      result = result.replaceRange(range.start, range.end, '');
    }
    return result;
  }

  bool _isConstructorCall(Token token, String source) {
    // Check if this is a collection literal ([] or {})
    if (token.type == TokenType.OPEN_SQUARE_BRACKET ||
        token.type == TokenType.OPEN_CURLY_BRACKET) {
      // Check if this collection literal is part of a parameter assignment
      // by looking backwards for patterns like "= const" or "this.property = const"
      if (_isInParameterAssignment(token, source)) {
        return false; // Keep const for parameter assignments
      }
      return true;
    }

    // Generic collection: const <Type>[] or const <Type>{}
    if (token.type == TokenType.LT) {
      // Look ahead to see if this leads to a collection literal
      Token? afterGeneric = _skipGenericTypes(token);
      if (afterGeneric != null &&
          (afterGeneric.type == TokenType.OPEN_SQUARE_BRACKET ||
              afterGeneric.type == TokenType.OPEN_CURLY_BRACKET)) {
        // Check if this is part of a parameter assignment
        if (_isInParameterAssignment(token, source)) {
          return false; // Keep const for parameter assignments
        }
      }
      return true;
    }

    // Check if this looks like a constructor call (identifier followed by parenthesis)
    if (token.type == TokenType.IDENTIFIER) {
      Token? nextToken = token.next;

      // Skip whitespace
      while (nextToken != null && nextToken.lexeme.trim().isEmpty) {
        nextToken = nextToken.next;
      }

      if (nextToken != null) {
        // Direct constructor call: const Widget()
        if (nextToken.type == TokenType.OPEN_PAREN) {
          return true;
        }

        // Generic constructor call: const Widget<T>()
        if (nextToken.type == TokenType.LT) {
          return true;
        }

        // Collection literals after identifier: const Widget[] or const Widget{}
        if (nextToken.type == TokenType.OPEN_SQUARE_BRACKET ||
            nextToken.type == TokenType.OPEN_CURLY_BRACKET) {
          return true;
        }

        // Check if this is a type declaration (variable declaration)
        // If we find another identifier after the first one, it's likely a variable declaration
        // e.g., "const Map<String, int> variableName = ..."
        if (nextToken.type == TokenType.LT) {
          // Skip through generic type parameters to find what comes after
          Token? afterGeneric = _skipGenericTypes(nextToken);
          if (afterGeneric != null &&
              afterGeneric.type == TokenType.IDENTIFIER) {
            // This looks like: const Type<Generic> variableName
            return false; // This is a variable declaration
          }
        } else if (nextToken.type == TokenType.IDENTIFIER) {
          // This looks like: const Type variableName
          return false; // This is a variable declaration
        }
      }
    }

    return false;
  }

  bool _isInParameterAssignment(Token token, String source) {
    // Get the text before the current token to analyze context
    final beforeText = source.substring(0, token.offset).trim();

    // Look for patterns that indicate parameter assignment:
    // - "this.property = const"
    // - "property = const"
    // - "property: const" (named parameters)
    final assignmentPatterns = [
      RegExp(r'this\.\w+\s*=\s*const\s*$'),
      RegExp(r'\w+\s*=\s*const\s*$'),
      RegExp(r'\w+\s*:\s*const\s*$'),
    ];

    return assignmentPatterns.any((pattern) => pattern.hasMatch(beforeText));
  }

  Token? _skipGenericTypes(Token startToken) {
    if (startToken.type != TokenType.LT) return startToken;

    Token? current = startToken.next;
    int depth = 1;

    while (current != null && depth > 0) {
      if (current.type == TokenType.LT) {
        depth++;
      } else if (current.type == TokenType.GT) {
        depth--;
      }
      current = current.next;
    }

    // Skip whitespace after closing >
    while (current != null && current.lexeme.trim().isEmpty) {
      current = current.next;
    }

    return current;
  }
}

class _Range {
  final int start;
  final int end;
  _Range({required this.start, required this.end});
}
