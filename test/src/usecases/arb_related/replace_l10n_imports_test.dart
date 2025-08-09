import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/arb_related/replace_l10n_imports.dart';
import 'package:test/test.dart';

void main() {
  group('replaceImportsIfNeeded', () {
    late L10nProjectConfigWithData syntheticConfig;
    late L10nProjectConfigWithData nonSyntheticConfig;

    setUp(() {
      syntheticConfig =
          L10nProjectConfig.withData(
                l10nFileName: '/Users/test/project/l10n.yaml',
                templateArbFile: 'app_en.arb',
                outputClass: 'AppLocalizations',
                outputDir: 'lib/gen_l10n',
                arbDir: 'lib/l10n',
                syntheticPackage: true,
              )
              as L10nProjectConfigWithData;

      nonSyntheticConfig =
          L10nProjectConfig.withData(
                l10nFileName: '/Users/test/project/l10n.yaml',
                templateArbFile: 'app_en.arb',
                outputClass: 'AppLocalizations',
                outputDir: 'lib/gen_l10n',
                arbDir: 'lib/l10n',
                syntheticPackage: false,
              )
              as L10nProjectConfigWithData;
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
}