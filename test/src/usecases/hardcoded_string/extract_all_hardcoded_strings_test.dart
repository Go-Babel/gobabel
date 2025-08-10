import 'dart:io';

import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/hardcoded_string/extract_all_hardcoded_strings.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  group('extractAllStringsInDart', () {
    test('should skip non-dart files', () async {
      // Create test files
      final testDir = Directory.systemTemp.createTempSync('babel_test_');
      final dartFile = File('${testDir.path}/test.dart');
      final txtFile = File('${testDir.path}/test.txt');
      final jsFile = File('${testDir.path}/test.js');

      // Write content to files
      await dartFile.writeAsString('''
void main() {
  print("This is a test string");
}
''');
      await txtFile.writeAsString('This is a text file with "strings"');
      await jsFile.writeAsString('console.log("JavaScript string");');

      // Extract strings from all files
      final result = await extractAllStringsInDart(
        files: [dartFile, txtFile, jsFile],
      );

      // Clean up
      testDir.deleteSync(recursive: true);

      // Verify only dart file was processed
      expect(result.isSuccess(), true);
      final strings = result.getOrThrow();
      expect(strings.length, 1);
      expect(strings.first.value, '"This is a test string"');
    });

    test(
      'should filter out files in ARB directory when projectArbData is withData',
      () async {
        // Create test directory structure
        final testDir = Directory.systemTemp.createTempSync('babel_test_');
        final libDir = Directory('${testDir.path}/lib')..createSync();
        final arbDir = Directory('${testDir.path}/lib/l10n')..createSync();

        // Create test files
        final normalFile = File('${libDir.path}/normal.dart');
        final arbDirFile = File('${arbDir.path}/arb_file.dart');

        // Write content to files
        await normalFile.writeAsString('''
void main() {
  print("Normal file string");
}
''');
        await arbDirFile.writeAsString('''
void main() {
  print("ARB directory string");
}
''');

        // Create mock state with ARB data using relative path as it would be in l10n.yaml
        final projectArbData = ArbDataState.withData(
          config: L10nProjectConfig.withData(
            l10nFileName: 'l10n.yaml',
            templateArbFile: 'app_en.arb',
            outputClass: 'AppLocalizations',
            outputDir: 'lib/generated',
            arbDir: 'lib/l10n', // Relative path as it would be in l10n.yaml
            syntheticPackage: true,
          ),
          variablesPlaceholdersPerKey: {},
          mainLocale: BabelSupportedLocales.enUS,
          preMadeTranslationArb: [],
        );

        // Note: Since we can't easily test the generate_extractAllStringsInDart function
        // without a full flow state, we'll test the core filtering logic directly
        final allFiles = [normalFile, arbDirFile];

        // Apply the same filtering logic as in the actual implementation
        final projectDirectoryPath =
            testDir.path; // Simulate payload.directoryPath
        final filesToProcess =
            projectArbData.mapOrNull(
              withData: (arbData) {
                final arbDir = arbData.config.mapOrNull(
                  withData: (config) => config.arbDir,
                );

                if (arbDir != null) {
                  // Resolve ARB directory relative to project directory
                  final arbDirPath = p.join(projectDirectoryPath, arbDir);
                  final normalizedArbDirPath = p.normalize(arbDirPath);

                  return allFiles.where((file) {
                    final normalizedFilePath = p.normalize(file.absolute.path);
                    // Use isWithin for robust containment check
                    return !p.isWithin(
                      normalizedArbDirPath,
                      normalizedFilePath,
                    );
                  }).toList();
                }

                return allFiles;
              },
              noneData: (_) => allFiles,
            ) ??
            allFiles;

        // Extract strings only from filtered files
        final result = await extractAllStringsInDart(files: filesToProcess);

        // Clean up
        testDir.deleteSync(recursive: true);

        // Verify only normal file was processed
        expect(result.isSuccess(), true);
        final strings = result.getOrThrow();
        expect(strings.length, 1);
        expect(strings.first.value, '"Normal file string"');
        // ARB directory file should have been filtered out
        expect(
          strings.any((s) => s.value.contains('ARB directory string')),
          false,
        );
      },
    );
  });
}

final String contentTest = '''import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoutbox/gen_l10n/s.dart';
import 'package:scoutbox/main.dart';

class LoadingBuilder<T> extends StatefulWidget {
  const LoadingBuilder({
    super.key,
    required this.future,
    required this.builder,
  });
  final Future<T> future;
  final Widget Function(BuildContext, T) builder;

  @override
  State<LoadingBuilder<T>> createState() => _LoadingBuilderState<T>();
}

final class _LoadingBuilderState<T> extends State<LoadingBuilder<T>> {
  final _completer = Completer<T>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.future.then((value) {
        if (mounted) {
          _completer.complete(value);
        }
      }).catchError((Object e, StackTrace s) {
        talker.error(
          'Error in LoadingBuilder',
          e,
          s,
        );
        if (mounted) {
          _completer.completeError(e, s);
        }
        throw e;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _completer.future,
      builder: (
        BuildContext context,
        AsyncSnapshot<T> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(S.of(context)!.an_error_occurred),
          );
        }
        if (snapshot.hasData) {
          return widget.builder(context, snapshot.data as T);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
''';
