import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_dynamic_value_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/usecases/hardcoded_string/validate_candidate_string.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

@override
AsyncBabelResult<List<HardcodedStringEntity>> extractAllStringsInDart({
  required List<File> files,
}) async {
  final List<HardcodedStringEntity> allStrings = [];

  final totalFiles = files.where((f) => f.path.endsWith('.dart')).length;
  int processedFiles = 0;

  // Show progress bar only if there are multiple files
  final showProgressBar = totalFiles > 10;

  for (final file in files) {
    if (!file.path.endsWith('.dart')) continue;

    processedFiles++;

    if (showProgressBar) {
      LoadingIndicator.instance.setLoadingProgressBar(
        message: 'Extracting all strings from Dart files...',
        barProgressInfo: BarProgressInfo(
          message: 'Processing ${p.basename(file.path)}',
          totalSteps: totalFiles,
          currentStep: processedFiles,
        ),
      );
    }

    final String content;
    try {
      content = await file.readAsString();
    } catch (error, stackTrace) {
      return BabelFailureResponse.withErrorAndStackTrace(
        exception: BabelException(
          title: 'File read error',
          description:
              'Failed to read file ${file.path}\n'
              'Please ensure the file exists and you have read permissions.',
        ),
        error: error,
        stackTrace: stackTrace,
      ).toFailure();
    }

    final rawList = <_RawString>[];

    try {
      final unit = parseString(content: content, path: file.path).unit;
      unit.accept(_RawStringScanner(file.path, content, rawList));
    } catch (e) {
      // Skip files that can't be parsed
      continue;
    }

    // Sort rawList by start position ascending
    rawList.sort((a, b) => a.start.compareTo(b.start));

    // For each raw string, find parent raw if any
    for (var raw in rawList) {
      _RawString? parent;
      for (var cand in rawList) {
        if (cand == raw) break;
        if (cand.start <= raw.start && cand.end >= raw.end) {
          if (parent == null ||
              (cand.end - cand.start) < (parent.end - parent.start)) {
            parent = cand;
          }
        }
      }

      final parentStart = parent != null ? raw.start - parent.start : null;
      final parentEnd = parent != null ? raw.end - parent.start : null;

      final isValid = validateCandidateHardcodedString.call(
        content: raw.stringValue?.trimHardcodedString ?? '',
      );
      if (!isValid) continue;

      allStrings.add(
        HardcodedStringEntity(
          value: raw.stringValue ?? '',
          filePath: raw.filePath,
          parentStartIndex: parentStart,
          parentEndIndex: parentEnd,
          fileStartIndex: raw.start,
          fileEndIndex: raw.end,
          dynamicFields: raw.dynamics,
        ),
      );
    }
  }

  return allStrings.toSuccess();
}

/// Temporary record for raw string nodes.
class _RawString {
  final int start;
  final int end;
  final String? stringValue;
  final String filePath;
  final List<HardcodedStringDynamicValue> dynamics;

  _RawString({
    required this.start,
    required this.end,
    required this.stringValue,
    required this.filePath,
    required this.dynamics,
  });
}

/// AST visitor that collects raw string literals and their interpolations.
class _RawStringScanner extends RecursiveAstVisitor<void> {
  final String filePath;
  final String content;
  final List<_RawString> rawList;

  _RawStringScanner(this.filePath, this.content, this.rawList);

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    if (node.thisOrAncestorOfType<Annotation>() != null) return;
    // Ignore strings that are map keys or values
    if (node.thisOrAncestorOfType<MapLiteralEntry>() != null) return;
    _addRaw(node);
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    if (node.thisOrAncestorOfType<Annotation>() != null) return;
    // Ignore strings that are map keys or values
    if (node.thisOrAncestorOfType<MapLiteralEntry>() != null) return;
    _addRaw(node);
    super.visitStringInterpolation(node);
  }

  void _addRaw(StringLiteral node) {
    // Collect dynamic fields if interpolation
    final dyn = <HardcodedStringDynamicValue>[];
    if (node is StringInterpolation) {
      for (var element in node.elements) {
        if (element is InterpolationExpression) {
          final start = element.offset;
          final end = element.end;
          final placeholder = content.substring(start, end);
          dyn.add(
            HardcodedStringDynamicValue(
              value: placeholder,
              parentStartIndex: start - node.offset,
              parentEndIndex: end - node.offset,
              fileStartIndex: start,
              fileEndIndex: end,
            ),
          );
        }
      }
    }

    // Snippet: full literal including quotes
    final snippet = content.substring(node.offset, node.end);

    rawList.add(
      _RawString(
        start: node.offset,
        end: node.end,
        stringValue: snippet,
        filePath: filePath,
        dynamics: dyn,
      ),
    );
  }
}

AsyncBabelResult<GenerateFlowExtractedAllStrings>
generate_extractAllStringsInDart(
  GenerateFlowRemovedConstFromStructuresWithStrings payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  // Filter out files in ARB directory if projectArbData is withData
  final filesToProcess =
      payload.projectArbData.mapOrNull(
        withData: (arbData) {
          final arbDir = arbData.config.mapOrNull(
            withData: (config) => config.arbDir,
          );

          if (arbDir != null) {
            // Resolve ARB directory relative to project directory
            final arbDirPath = p.join(payload.directoryPath, arbDir);
            final normalizedArbDirPath = p.normalize(arbDirPath);

            // Filter out files that are inside the ARB directory
            return targetFiles.where((file) {
              final normalizedFilePath = p.normalize(file.absolute.path);
              // Use isWithin for robust containment check
              return !p.isWithin(normalizedArbDirPath, normalizedFilePath);
            }).toList();
          }

          return targetFiles;
        },
        noneData: (_) => targetFiles,
      ) ??
      targetFiles;

  final extractResult = await extractAllStringsInDart(files: filesToProcess);

  if (extractResult.isError()) {
    return extractResult.asBabelResultErrorAsync();
  }

  final allExtractedStrings = extractResult.getOrThrow();

  // Check if there are no strings to process
  final hardcodedStringToKeyCache =
      payload.codebaseArbTranslationPayloadInfo.hardcodedStringToKeyCache;
  final noneOrResolverResolvedAnyString =
      allExtractedStrings.isEmpty && hardcodedStringToKeyCache.isEmpty;

  if (noneOrResolverResolvedAnyString) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'No hardcoded strings found',
        description:
            'No hardcoded strings were found in the provided files. Please check your codebase and try again.',
      ),
    ).toFailure();
  }

  return GenerateFlowExtractedAllStrings(
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
    allExtractedStrings: allExtractedStrings,
  ).toSuccess();
}
