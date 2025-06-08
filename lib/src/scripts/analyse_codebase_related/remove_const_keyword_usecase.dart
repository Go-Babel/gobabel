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
      final transformed = _removeConsts(source);
      if (transformed != source) {
        await file.writeAsString(transformed);
      }
    }
  }

  @visibleForTesting
  String _removeConsts(String source) {
    final parseResult = parseString(
      content: source,
      featureSet: FeatureSet.latestLanguageVersion(),
      throwIfDiagnostics: false,
    );

    Token? token = parseResult.unit.beginToken;
    final ranges = <_Range>[];
    while (token.type != TokenType.EOF) {
      if (token.lexeme == 'const') {
        ranges.add(_Range(start: token.offset, end: token.end));
      }
      token = token.next!;
    }

    var result = source;
    for (final range in ranges.reversed) {
      result = result.replaceRange(range.start, range.end, '');
    }
    return result;
  }
}

class _Range {
  final int start;
  final int end;
  _Range({required this.start, required this.end});
}
