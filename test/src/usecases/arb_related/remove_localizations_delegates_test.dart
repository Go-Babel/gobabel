import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/arb_related/remove_localizations_delegates.dart';
import 'package:test/test.dart';

void main() {
  final sConfig = L10nProjectConfigWithData(
    l10nFileName: '/Users/test/project/l10n.yaml',
    templateArbFile: 'app_en.arb',
    outputClass: 'S',
    outputDir: 'lib/gen_l10n',
    arbDir: 'lib/l10n',
    syntheticPackage: true,
  );
  group('extractImportAlias', () {
    test('extracts alias from import statement', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as l10n;
import 'package:provider/provider.dart';
''';

      final alias = extractImportAlias(
        fileContent: fileContent,
        importString: 'package:flutter_gen/gen_l10n/app_localizations.dart',
      );

      expect(alias, equals('l10n'));
    });

    test('returns empty string when no alias present', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
''';

      final alias = extractImportAlias(
        fileContent: fileContent,
        importString: 'package:flutter_gen/gen_l10n/app_localizations.dart',
      );

      expect(alias, isEmpty);
    });

    test('handles different import formats', () {
      const fileContent = '''
import "package:flutter_gen/gen_l10n/app_localizations.dart" as myL10n;
''';

      final alias = extractImportAlias(
        fileContent: fileContent,
        importString: 'package:flutter_gen/gen_l10n/app_localizations.dart',
      );

      expect(alias, equals('myL10n'));
    });
  });

  group('removeLocalizationsDelegatesIfNeeded', () {
    late L10nProjectConfigWithData testConfig;

    setUp(() {
      testConfig =
          L10nProjectConfig.withData(
                l10nFileName: '/Users/test/project/l10n.yaml',
                templateArbFile: 'app_en.arb',
                outputClass: 'AppLocalizations',
                outputDir: 'lib/gen_l10n',
                arbDir: 'lib/l10n',
                syntheticPackage: true,
              )
              as L10nProjectConfigWithData;
    });

    test('removes single delegate in list', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

MaterialApp(
  localizationsDelegates: [AppLocalizations.delegate],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('AppLocalizations.delegate')));
      expect(result, contains('supportedLocales'));
    });

    test('removes delegate at start of list', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

MaterialApp(
  localizationsDelegates: const [
    ...AppLocalizations.delegate,
    ...report_generator.AppLocalizations.delegate,
    ...dsf_video_player.AppLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('...AppLocalizations.delegate')));
      expect(result, contains('report_generator.AppLocalizations.delegate'));
      expect(result, contains('dsf_video_player.AppLocalizations.delegate'));
    });

    test('removes delegate at end of list', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

MaterialApp(
  localizationsDelegates: const [
    ...report_generator.AppLocalizations.delegate,
    ...dsf_video_player.AppLocalizations.delegate,
    ...AppLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('...AppLocalizations.delegate,')));
      expect(result, contains('report_generator.AppLocalizations.delegate'));
      expect(result, contains('dsf_video_player.AppLocalizations.delegate'));
    });

    test('removes delegate in middle of list', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

MaterialApp(
  localizationsDelegates: const [
    ...report_generator.AppLocalizations.delegate,
    ...AppLocalizations.delegate,
    ...dsf_video_player.AppLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('...AppLocalizations.delegate,')));
      expect(result, contains('report_generator.AppLocalizations.delegate'));
      expect(result, contains('dsf_video_player.AppLocalizations.delegate'));
    });

    test('handles delegate with alias', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart' as l10n;

MaterialApp(
  localizationsDelegates: const [
    ...l10n.AppLocalizations.delegate,
    ...other_package.AppLocalizations.delegate,
  ],
  supportedLocales: l10n.AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('l10n.AppLocalizations.delegate')));
      expect(result, contains('other_package.AppLocalizations.delegate'));
    });

    test('preserves delegates from other packages', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';
import 'package:report_generator/l10n/app_localizations.dart' as report_generator;

MaterialApp(
  localizationsDelegates: const [
    ...AppLocalizations.delegate,
    ...report_generator.AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('...AppLocalizations.delegate')));
      expect(result, contains('report_generator.AppLocalizations.delegate'));
      expect(result, contains('GlobalMaterialLocalizations.delegate'));
      expect(result, contains('GlobalWidgetsLocalizations.delegate'));
    });

    test('returns false when no localizationsDelegates present', () {
      const fileContent = '''
import 'package:flutter/material.dart';

MaterialApp(
  title: 'My App',
  home: HomePage(),
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isFalse);
      expect(result, equals(fileContent));
    });

    test('handles S class with delegates', () {
      final sConfig =
          L10nProjectConfig.withData(
                l10nFileName: '/Users/test/project/l10n.yaml',
                templateArbFile: 'app_en.arb',
                outputClass: 'S',
                outputDir: 'lib/gen_l10n',
                arbDir: 'lib/l10n',
                syntheticPackage: true,
              )
              as L10nProjectConfigWithData;

      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/s.dart';

MaterialApp(
  localizationsDelegates: const [
    ...S.delegate,
    ...other.S.delegate,
  ],
  supportedLocales: S.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: sConfig,
        projectName: 'scoutbox',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('...S.delegate,')));
      expect(result, contains('other.S.delegate'));
    });

    test('handles localizationsDelegates without spread operator', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

MaterialApp(
  localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('AppLocalizations.delegate,')));
      expect(result, contains('GlobalMaterialLocalizations.delegate'));
    });

    test('handles multiple occurrences in same file', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

MaterialApp(
  localizationsDelegates: const [
    ...AppLocalizations.delegate,
    ...other.AppLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
)

MaterialApp.router(
  localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      // All project's AppLocalizations.delegate should be removed
      expect(result, isNot(contains('...AppLocalizations.delegate')));
      // Ensure there is no unqualified AppLocalizations.delegate item left
      expect(
        RegExp(
          r'^\s*AppLocalizations\.delegate,',
          multiLine: true,
        ).hasMatch(result),
        isFalse,
      );
      // But keep ones from other packages
      expect(result, contains('other.AppLocalizations.delegate'));
      expect(result, contains('GlobalMaterialLocalizations.delegate'));
    });

    test('cleans up empty localizationsDelegates array', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

MaterialApp(
  localizationsDelegates: [AppLocalizations.delegate],
  supportedLocales: AppLocalizations.supportedLocales,
)
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('localizationsDelegates')));
      expect(result, contains('supportedLocales'));
    });

    test('handles complex nested structures', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        ...AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegate,
        ...GlobalWidgetsLocalizations.delegate,
        ...GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
    );
  }
}
''';

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: testConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('...AppLocalizations.delegate')));
      expect(result, contains('GlobalMaterialLocalizations.delegate'));
      expect(result, contains('GlobalWidgetsLocalizations.delegate'));
      expect(result, contains('GlobalCupertinoLocalizations.delegate'));
    });
  });

  group('real world example', () {
    test(
      'real world example - should remove the expected target line but keep the others',
      () {
        final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
          fileContent: mainExample,
          projectConfig: sConfig,
          projectName: 'scoutbox',
        );
        print(result);
        expect(hasChanges, isTrue);

        // Should remove S.localizationsDelegates but keep others
        expect(result.contains('...S.localizationsDelegates,'), isFalse);
        expect(result, contains('report_generator.S.localizationsDelegates'));
        expect(result, contains('dsf_video_player.S.localizationsDelegates'));
        // Should still have the localizationsDelegates property with remaining delegates
        expect(result, contains('localizationsDelegates:'));
        // Entire output must match the expected output exactly (no formatting drift)
        expect(result, equals(expectedMainOutput));
      },
    );

    test(
      'real world example - should mantain the other lines before/after the changed one without changes.',
      () {
        final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
          fileContent: mainExample,
          projectConfig: sConfig,
          projectName: 'scoutbox',
        );
        print(result);

        // Sanity check: we changed something
        expect(hasChanges, isTrue);

        // The whole output should exactly match the expected output
        expect(result, equals(expectedMainOutput));

        // Additionally, guarantee that only the target line was modified by
        // verifying that all lines before and after the removed one remain intact.
        final inputLines = mainExample.split('\n');
        final resultLines = result.split('\n');

        // Ensure the removed line exists in the input
        final removedIndex = inputLines.indexWhere(
          (l) => l.contains('...S.localizationsDelegates,'),
        );
        expect(removedIndex, isNonNegative);

        // Lines before the removed one must be identical
        for (var i = 0; i < removedIndex; i++) {
          expect(
            resultLines[i],
            inputLines[i],
            reason: 'Line ${i + 1} changed unexpectedly.',
          );
        }

        // Lines after the removed one must also be identical (accounting for the deletion)
        final inputLen = inputLines.length;
        final resultLen = resultLines.length;
        expect(
          resultLen,
          inputLen - 1,
          reason: 'Exactly one line should have been removed.',
        );

        // Compare from the end backwards
        for (var k = 1; k <= resultLen - removedIndex; k++) {
          final inputIdx = inputLen - k;
          final resultIdx = resultLen - k;
          expect(
            resultLines[resultIdx],
            inputLines[inputIdx],
            reason: 'Trailing line at ${inputIdx + 1} changed unexpectedly.',
          );
        }
      },
    );
  });
}

final String mainExample =
    '''import 'package:dsf_video_player/gen_l10n/s.dart' as dsf_video_player;
import 'package:flutter/material.dart';
import 'package:report_generator/gen_l10n/s.dart' as report_generator;
import 'package:scoutbox/gen_l10n/s.dart';

class MainExample extends StatefulWidget {
  const MainExample({super.key});

  @override
  State<MainExample> createState() => _MainExampleState();
}

class _MainExampleState extends State<MainExample> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        ...S.localizationsDelegates,
        ...report_generator.S.localizationsDelegates,
        ...dsf_video_player.S.localizationsDelegates,
      ],
    );
  }
}''';

final expectedMainOutput =
    '''import 'package:dsf_video_player/gen_l10n/s.dart' as dsf_video_player;
import 'package:flutter/material.dart';
import 'package:report_generator/gen_l10n/s.dart' as report_generator;
import 'package:scoutbox/gen_l10n/s.dart';

class MainExample extends StatefulWidget {
  const MainExample({super.key});

  @override
  State<MainExample> createState() => _MainExampleState();
}

class _MainExampleState extends State<MainExample> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        ...report_generator.S.localizationsDelegates,
        ...dsf_video_player.S.localizationsDelegates,
      ],
    );
  }
}''';
