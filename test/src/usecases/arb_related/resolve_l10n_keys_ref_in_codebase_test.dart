import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/arb_related/resolve_l10n_keys_ref_in_codebase.dart';
import 'package:test/test.dart';

void main() {
  group('replaceImportsIfNeeded', () {
    late L10nProjectConfigWithData syntheticConfig;
    late L10nProjectConfigWithData nonSyntheticConfig;

    setUp(() {
      syntheticConfig = L10nProjectConfig.withData(
        l10nFileName: '/Users/test/project/l10n.yaml',
        templateArbFile: 'app_en.arb',
        outputClass: 'AppLocalizations',
        outputDir: 'lib/gen_l10n',
        arbDir: 'lib/l10n',
        syntheticPackage: true,
      ) as L10nProjectConfigWithData;

      nonSyntheticConfig = L10nProjectConfig.withData(
        l10nFileName: '/Users/test/project/l10n.yaml',
        templateArbFile: 'app_en.arb',
        outputClass: 'AppLocalizations',
        outputDir: 'lib/gen_l10n',
        arbDir: 'lib/l10n',
        syntheticPackage: false,
      ) as L10nProjectConfigWithData;
    });

    test('removes standard import with synthetic package', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, contains("import 'package:flutter/material.dart';"));
      expect(result, contains("import 'package:provider/provider.dart';"));
      expect(result, isNot(contains('flutter_gen')));
    });

    test('removes import with alias', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart' as l10n;
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('as l10n')));
      expect(result, isNot(contains('flutter_gen')));
    });

    test('removes import with show directive', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart' show AppLocalizations, lookupAppLocalizations;
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('show AppLocalizations')));
      expect(result, isNot(contains('flutter_gen')));
    });

    test('removes import with hide directive', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart' hide SomeClass;
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('hide SomeClass')));
      expect(result, isNot(contains('flutter_gen')));
    });

    test('removes project package import when not using synthetic', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:my_app/gen_l10n/applocalizations.dart';
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: nonSyntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('package:my_app/gen_l10n')));
    });

    test('removes old flutter_gen import when switching to non-synthetic', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: nonSyntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('flutter_gen')));
    });

    test('removes old project import when switching to synthetic', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:my_app/some_path/applocalizations.dart';
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('package:my_app/')));
      expect(result, isNot(contains('applocalizations.dart')));
    });

    test('handles multiple imports in same file', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';
import 'package:my_app/gen_l10n/applocalizations.dart' as old_l10n;
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('flutter_gen')));
      expect(result, isNot(contains('old_l10n')));
      expect(result, isNot(contains('applocalizations.dart')));
    });

    test('returns false when no matching imports found', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isFalse);
      expect(result, equals(fileContent));
    });

    test('handles imports with single quotes', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('flutter_gen')));
    });

    test('handles imports with double quotes', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/applocalizations.dart";
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('flutter_gen')));
    });

    test('preserves other imports untouched', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../widgets/custom_widget.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, contains("import 'package:flutter/material.dart';"));
      expect(result, contains("import 'package:provider/provider.dart';"));
      expect(result, contains("import 'dart:async';"));
      expect(result, contains("import '../widgets/custom_widget.dart';"));
      expect(result, isNot(contains('flutter_gen')));
    });

    test('real world example - S class with synthetic package', () {
      final sConfig = L10nProjectConfig.withData(
        l10nFileName: '/Users/test/project/l10n.yaml',
        templateArbFile: 'app_en.arb',
        outputClass: 'S',
        outputDir: 'lib/gen_l10n',
        arbDir: 'lib/l10n',
        syntheticPackage: true,
      ) as L10nProjectConfigWithData;

      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/s.dart';
import 'package:scoutbox/gen_l10n/s.dart' as old_s;

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Babel.someKey);
  }
}
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: sConfig,
        projectName: 'scoutbox',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('flutter_gen')));
      expect(result, isNot(contains('scoutbox/gen_l10n')));
      expect(result, isNot(contains('s.dart')));
    });

    test('handles import without semicolon', () {
      const fileContent = '''
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/applocalizations.dart'
import 'package:provider/provider.dart';
''';

      final (result, hasChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: syntheticConfig,
        projectName: 'my_app',
      );

      expect(hasChanges, isTrue);
      expect(result, isNot(contains('flutter_gen')));
      expect(result, contains("import 'package:flutter/material.dart';"));
      expect(result, contains("import 'package:provider/provider.dart';"));
    });
  });

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
      testConfig = L10nProjectConfig.withData(
        l10nFileName: '/Users/test/project/l10n.yaml',
        templateArbFile: 'app_en.arb',
        outputClass: 'AppLocalizations',
        outputDir: 'lib/gen_l10n',
        arbDir: 'lib/l10n',
        syntheticPackage: true,
      ) as L10nProjectConfigWithData;
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
      final sConfig = L10nProjectConfig.withData(
        l10nFileName: '/Users/test/project/l10n.yaml',
        templateArbFile: 'app_en.arb',
        outputClass: 'S',
        outputDir: 'lib/gen_l10n',
        arbDir: 'lib/l10n',
        syntheticPackage: true,
      ) as L10nProjectConfigWithData;

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
      expect(result, isNot(contains('AppLocalizations.delegate,')));
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
}