import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/arb_related/resolve_l10n_keys_ref_in_codebase.dart';
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

    test('real world example - removes S.localizationsDelegates from scoutbox', () {
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

      final (result, hasChanges) = removeLocalizationsDelegatesIfNeeded(
        fileContent: realWordExampleForRemoveLocalizationsDelegatesIfNeeded,
        projectConfig: sConfig,
        projectName: 'scoutbox',
      );

      expect(hasChanges, isTrue);
      // Should remove S.localizationsDelegates but keep others
      expect(result, isNot(contains('...S.localizationsDelegates,')));
      expect(result, contains('report_generator.S.localizationsDelegates'));
      expect(result, contains('dsf_video_player.S.localizationsDelegates'));
      // Should still have the localizationsDelegates property with remaining delegates
      expect(result, contains('localizationsDelegates:'));
    });
  });
}

final String realWordExampleForRemoveLocalizationsDelegatesIfNeeded =
    r'''// ignore_for_file: avoid_redundant_argument_values, prefer_int_literals, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dsf_commum_ref_providers/dsf_commum_ref_providers.dart';
import 'package:dsf_video_player/gen_l10n/s.dart' as dsf_video_player;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:player_source_models/models/flavor.dart';
import 'package:report_generator/gen_l10n/s.dart' as report_generator;
import 'package:scoutbox/core/client/analytics_service.dart';
import 'package:scoutbox/core/client/dio_client.dart';
import 'package:scoutbox/core/client/talker.dart';
import 'package:scoutbox/core/client/widget_rebirth.dart';
import 'package:scoutbox/core/extensions/duration.dart';
import 'package:scoutbox/core/extensions/firebase.dart';
import 'package:scoutbox/core/extensions/list_string.dart';
import 'package:scoutbox/core/extensions/slack_notifier.dart';
import 'package:scoutbox/core/utils/observers/route_observers.dart';
import 'package:scoutbox/data/account.dart';
import 'package:scoutbox/env.dart';
import 'package:scoutbox/firebase_options.dart';
import 'package:scoutbox/gen_l10n/s.dart';
import 'package:scoutbox/no_internet_wrapper.dart';
import 'package:scoutbox/pages/player_information_page/widgets/history/base_ogol_history_and_stats_widget.dart';
import 'package:scoutbox/providers/account.dart';
import 'package:scoutbox/providers/amazon_root_ca_pem.dart';
import 'package:scoutbox/repositories/players/new_pro_players_repository.dart';
import 'package:scoutbox/router.dart';
import 'package:scoutbox/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slack_notifier/slack_notifier.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';

final Talker talker = TalkerFlutter.init(
  settings: TalkerSettings(
    colors: {
      TalkerLogType.verbose.key: AnsiPen()..yellow(),
    },
  ),
);

// bool willShowDebugOptions => email;
final willShowDebugOptionsProvider = StateProvider<bool>((ref) {
  return ref
      .watch(emailProvider)
      .contains('contact+palmeiras@dreamstock.co.jp');
});

final eurToUsdRateProvider = FutureProvider<double?>((ref) async {
  try {
    final response = await Dio().get<Map<String, dynamic>>(
      'https://currency-api.pages.dev/v1/currencies/eur.json',
    );
    if (response.statusCode == 200) {
      final value =
          (response.data!['eur'] as Map<String, dynamic>)['usd']! as double;
      return double.parse(value.toStringAsFixed(2));
    }
  } catch (e, s) {
    await ref.read(crashlyticsProvider).recordErrorIncludeWindows(e, s);
  }
  return 1.10;
});

bool didAlreadyClearedPersistence = false;

final navigatorKey = GlobalKey<NavigatorState>();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final securityContext = (context ?? SecurityContext(withTrustedRoots: true))
      ..setTrustedCertificatesBytes(utf8.encode(amazonRootCaPem));

    return super.createHttpClient(securityContext);
  }
}

late final bool willShowAcademy;
void main() {
  const flavor = String.fromEnvironment('FLAVOR');
  willShowAcademy = const bool.fromEnvironment('willAllowAcademy')
      //
      ;

  runZonedGuarded<Future<void>>(
    () async {
      Env.initialize(flavor == 'prod' ? Flavor.prod : Flavor.dev);

      WidgetsFlutterBinding.ensureInitialized();

      // Apply initial orientation lock based on device
      try {
        // Get screen size without MediaQuery
        final window = WidgetsBinding.instance.window;
        final size = window.physicalSize / window.devicePixelRatio;
        final maxDimension =
            size.width > size.height ? size.width : size.height;

        if (maxDimension > 700) {
          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        } else {
          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        }
      } catch (e) {
        // Default to all orientations if error
        await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      }

      HttpOverrides.global = MyHttpOverrides();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await AnalyticsService().init();

      VideoPlayerMediaKit.ensureInitialized(
        android:
            true, // default: false    -    dependency: media_kit_libs_android_video
        iOS:
            true, // default: false    -    dependency: media_kit_libs_ios_video
        macOS:
            true, // default: false    -    dependency: media_kit_libs_macos_video
        windows:
            true, // default: false    -    dependency: media_kit_libs_windows_video
        linux: true, // default: false    -    dependency: media_kit_libs_linux
      );
      // Temporary code for windows support
      if (Platform.isWindows && !didAlreadyClearedPersistence) {
        await FirebaseFirestore.instance.clearPersistence();
        didAlreadyClearedPersistence = true;
      }

      currYear = DateTime.now().year;
      if (!Platform.isWindows) {
        FlutterError.onError =
            FirebaseCrashlyticsExt.instance?.recordFlutterFatalError;
      }

      EasyLoading.instance
        ..userInteractions = false
        ..maskColor = Colors.black.withOpacity(0.5);

      final pref = await SharedPreferences.getInstance();

      return runApp(
        TalkerWrapper(
          talker: talker,
          options: const TalkerWrapperOptions(
            enableErrorAlerts: kDebugMode,
            // ignore: avoid_redundant_argument_values
            enableExceptionAlerts: kDebugMode,
          ),
          child: WidgetRebirth(
            materialApp: ProviderScope(
              overrides: [
                sharedPreferencesProvider.overrideWithValue(pref),
              ],
              observers: [
                if (kDebugMode) TalkerRiverpodObserver(talker: talker),
              ],
              child: const MyApp(),
            ),
          ),
        ),
      );
    },
    (error, stack) {
      talker.handle(
        error,
        stack,
      );
      FirebaseCrashlytics.instance.recordErrorIncludeWindows(error, stack);
      EasyLoading.dismiss().then((_) {
        if ((error is DioException) || (error is HttpException)) {
          var text = 'UNKNOWN ERROR';

          if (error is DioException) {
            text = 'HTTP ERROR ${error.response?.statusCode ?? 0}';
          } else if (error is HttpException) {
            text = 'HTTP ERROR ${int.tryParse(error.message) ?? 0}';
          }
          EasyLoading.showError(text, duration: const Duration(seconds: 5));
        }
      });
    },
  );
}

String userUuid = '';

class ScreenAutoScaleSafeArea extends StatelessWidget {
  const ScreenAutoScaleSafeArea({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding,
        top: topPadding,
      ),
      child: child,
    );
  }
}

double bottomPadding = 0.0;
double topPadding = 0.0;
const desktopWidth = 1512.0;
const mobileWidth = 428.0;
const mobileBreakpoint = 650.0;

class ScreenAutoScaleWrapper extends StatefulWidget {
  const ScreenAutoScaleWrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<ScreenAutoScaleWrapper> createState() => _ScreenAutoScaleWrapperState();
}

class _ScreenAutoScaleWrapperState extends State<ScreenAutoScaleWrapper> {
  @override
  void initState() {
    super.initState();
    // Get bottom padding (safe area)
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        bottomPadding = MediaQuery.of(context).padding.bottom;
        topPadding = MediaQuery.of(context).padding.top;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        // Case 1: Width > 1512 - Use real sizes, no scaling
        if (screenWidth > desktopWidth || Platform.isWindows) {
          return widget.child;
        }

        // Determine target width based on screen size
        final targetWidth =
            screenWidth <= mobileBreakpoint ? mobileWidth : desktopWidth;
        final scale = screenWidth / targetWidth;
        final scaledHeight = screenHeight / scale;

        // Case 2 & 3: Scale to fixed width (1512 for desktop, 428 for mobile)
        return FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: targetWidth,
            height: scaledHeight,
            child: MediaQuery(
              data: MediaQueryData(
                size: Size(targetWidth, scaledHeight),
                devicePixelRatio: 1.0,
                textScaler: TextScaler.linear(1.0),
                padding: EdgeInsets.zero,
                viewInsets: EdgeInsets.zero,
                viewPadding: EdgeInsets.zero,
              ),
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => MyAppState();
}

bool hasTouchscreen = false;

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  Locale? _locale;

  void _setInitialHasTouchscreen() {
    // Check if the device has a touchscreen
    // On mobile platforms (iOS/Android), assume touchscreen is available
    // On desktop platforms, we can check for touch capability
    hasTouchscreen = Platform.isAndroid || Platform.isIOS || Platform.isFuchsia;
  }

  void _setHasTouchscreen(PointerEvent event) {
    if (event.kind == PointerDeviceKind.touch ||
        event.kind == PointerDeviceKind.stylus) {
      hasTouchscreen = true;
      WidgetsBinding.instance.pointerRouter
          .removeGlobalRoute(_setHasTouchscreen);
    }
  }

  void _setMethodCallHandler() {
    const MethodChannel('app_lifecycle').setMethodCallHandler((call) async {
      if (call.method == 'onAppWillTerminate') {
        await SlackNotifier(Env().slackWebhookTokenCloseApp).sendWithUser(
            title: 'Close App',
            account: ref.read(accountProvider),
            text:
                '*Route History*\n```\n${ref.read(routeObserverProvider).routeHistoryEvents.formatRouteHistory(context)}\n```',
            additionalFields: {
              'Uptime': AnalyticsService().uptime.formatString,
            });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setInitialHasTouchscreen();
    WidgetsBinding.instance.pointerRouter.addGlobalRoute(_setHasTouchscreen);
    WidgetsBinding.instance.addObserver(this);

    initializeDateFormatting();
    NewProPlayersRepository.create(ref.read(dioClientProvider));
    _setMethodCallHandler();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return ScreenAutoScaleWrapper(
      child: Portal(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            title: 'DSF PRO',
            theme: darkTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.dark,
            localizationsDelegates: const [
              ...S.localizationsDelegates,
              ...report_generator.S.localizationsDelegates,
              ...dsf_video_player.S.localizationsDelegates,
            ],
            locale: _locale,
            supportedLocales: const [
              Locale('en'),
              Locale('ja'),
              Locale('ko'),
              Locale('pt'),
            ],
            builder: (_, child) {
              return Stack(
                children: [
                  SizedBox.expand(
                    child: NoInternetWrapper(
                      child: EasyLoading.init()(context, child),
                    ),
                  ),
                  if (kDebugMode) ...[
                    // DraggableDebugFAB(builderContext: context),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class DraggableDebugFAB extends StatefulWidget {
  const DraggableDebugFAB({super.key, required this.builderContext});
  final BuildContext builderContext;

  @override
  State<DraggableDebugFAB> createState() => _DraggableDebugFABState();
}

class _DraggableDebugFABState extends State<DraggableDebugFAB> {
  // Variables to store the FAB's position
  double _xPosition = 400; // Initial X position
  double _yPosition = 20; // Initial Y position

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _xPosition,
      top: _yPosition,
      child: GestureDetector(
        onPanUpdate: (details) {
          // Update position based on drag
          setState(() {
            _xPosition += details.delta.dx;
            _yPosition += details.delta.dy;

            // Optional: Add boundaries to prevent FAB from moving off-screen
            _xPosition = _xPosition.clamp(
              0,
              MediaQuery.of(context).size.width - 60,
            ); // 60 is FAB size
            _yPosition = _yPosition.clamp(
              0,
              MediaQuery.of(context).size.height - 60,
            );
          });
        },
        child: FloatingActionButton(
          onPressed: () async {
            await showDialog<void>(
              context: navigatorKey.currentContext!,
              builder: (context) {
                return Dialog(
                  child: TalkerScreen(
                    talker: talker,
                    theme: TalkerScreenTheme(
                      logColors: {
                        GoodLog.getKey: const Color(0xff4CAF50),
                      },
                    ),
                  ),
                );
              },
            );
          },
          foregroundColor: Colors.black,
          backgroundColor: Colors.tealAccent,
          child: const Icon(Icons.receipt),
        ),
      ),
    );
  }
}''';
