import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:test/test.dart';

void main() {
  group('L10nProjectConfig', () {
    group('getImportString', () {
      test('returns flutter_gen import when syntheticPackage is true', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/test/project/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'AppLocalizations',
          outputDir: 'lib/gen_l10n',
          arbDir: 'lib/l10n',
          syntheticPackage: true,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('my_project');

        expect(
          result,
          equals('package:flutter_gen/gen_l10n/applocalizations.dart'),
        );
      });

      test('returns project package import when syntheticPackage is false', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/test/project/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'AppLocalizations',
          outputDir: 'lib/gen_l10n',
          arbDir: 'lib/l10n',
          syntheticPackage: false,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('my_project');

        expect(
          result,
          equals('package:my_project/gen_l10n/applocalizations.dart'),
        );
      });

      test('handles uppercase output class names correctly', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/test/project/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'S',
          outputDir: 'lib/gen_l10n',
          arbDir: 'lib/l10n',
          syntheticPackage: false,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('scoutbox');

        expect(
          result,
          equals('package:scoutbox/gen_l10n/s.dart'),
        );
      });

      test('removes lib/ prefix from outputDir when syntheticPackage is false', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/test/project/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'MyLocalizations',
          outputDir: 'lib/i18n/generated',
          arbDir: 'lib/l10n',
          syntheticPackage: false,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('test_app');

        expect(
          result,
          equals('package:test_app/i18n/generated/mylocalizations.dart'),
        );
      });

      test('handles outputDir without lib/ prefix correctly', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/test/project/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'L10n',
          outputDir: 'generated/l10n',
          arbDir: 'lib/l10n',
          syntheticPackage: false,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('my_app');

        expect(
          result,
          equals('package:my_app/generated/l10n/l10n.dart'),
        );
      });

      test('synthetic package always uses flutter_gen regardless of outputDir', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/test/project/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'Translations',
          outputDir: 'lib/custom/path',
          arbDir: 'lib/l10n',
          syntheticPackage: true,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('some_project');

        // Should ignore outputDir and project name when synthetic is true
        expect(
          result,
          equals('package:flutter_gen/gen_l10n/translations.dart'),
        );
      });

      test('handles mixed case output class names', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/test/project/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'MyAppLocalizations',
          outputDir: 'lib/l10n',
          arbDir: 'lib/l10n',
          syntheticPackage: false,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('flutter_app');

        expect(
          result,
          equals('package:flutter_app/l10n/myapplocalizations.dart'),
        );
      });

      test('real world example - scoutbox with S class', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/igormidev/gobabel/scoutbox-app/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'S',
          outputDir: 'lib/gen_l10n',
          arbDir: 'lib/l10n',
          syntheticPackage: true,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('scoutbox');

        expect(
          result,
          equals('package:flutter_gen/gen_l10n/s.dart'),
        );
      });

      test('real world example - scoutbox without synthetic package', () {
        final config = L10nProjectConfig.withData(
          l10nFileName: '/Users/igormidev/gobabel/scoutbox-app/l10n.yaml',
          templateArbFile: 'app_en.arb',
          outputClass: 'S',
          outputDir: 'lib/gen_l10n',
          arbDir: 'lib/l10n',
          syntheticPackage: false,
        ) as L10nProjectConfigWithData;

        final result = config.getImportString('scoutbox');

        expect(
          result,
          equals('package:scoutbox/gen_l10n/s.dart'),
        );
      });
    });
  });
}