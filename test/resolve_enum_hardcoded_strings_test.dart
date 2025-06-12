import 'package:test/test.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/resolve_enum_hardcoded_strings.dart';

void main() {
  group('ResolveEnumHardcodedStringsUsecase', () {
    late ResolveEnumHardcodedStringsUsecase usecase;

    setUp(() {
      usecase = ResolveEnumHardcodedStringsUsecase();
    });

    test('should transform enum with hardcoded strings to getters', () {
      const input = '''
import 'package:flutter/material.dart';

enum DashboardNavigationType {
  labels(
    label: 'Labels',
    activeIcon: Icons.translate,
    inactiveIcon: Icons.translate_outlined,
    routeOnClick: '/labels',
  ),
  languages(
    label: 'Languages',
    activeIcon: Icons.language,
    inactiveIcon: Icons.language,
    routeOnClick: '/languages',
  ),
  context(
    label: 'Context',
    activeIcon: Icons.generating_tokens_rounded,
    inactiveIcon: Icons.generating_tokens_outlined,
    routeOnClick: '/context',
  ),
  account(
    label: 'Account',
    activeIcon: Icons.person,
    inactiveIcon: Icons.person_outline,
    routeOnClick: '/account',
  ),
  pricePage(
    label: 'Pricing',
    activeIcon: Icons.person,
    inactiveIcon: Icons.person_outline,
    routeOnClick: '/pricing-page',
  ),
  project(
    label: 'Project',
    activeIcon: Icons.token,
    inactiveIcon: Icons.token_outlined,
    routeOnClick: '/project',
  ),
  history(
    label: 'History',
    activeIcon: Icons.restore_page_rounded,
    inactiveIcon: Icons.restore_page_outlined,
    routeOnClick: '/history',
  ),
  logOut(
    label: 'Log out',
    activeIcon: Icons.logout,
    inactiveIcon: Icons.logout,
    routeOnClick: null,
  );

  final String label;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String? routeOnClick;

  const DashboardNavigationType({
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.routeOnClick,
  });
}
''';

      final expectedResult = '''import 'package:flutter/material.dart';

enum DashboardNavigationType {
  labels(
    activeIcon: Icons.translate,
    inactiveIcon: Icons.translate_outlined,
  ),
  languages(
    activeIcon: Icons.language,
    inactiveIcon: Icons.language,
  ),
  context(
    activeIcon: Icons.generating_tokens_rounded,
    inactiveIcon: Icons.generating_tokens_outlined,
  ),
  account(
    activeIcon: Icons.person,
    inactiveIcon: Icons.person_outline,
  ),
  pricePage(
    activeIcon: Icons.person,
    inactiveIcon: Icons.person_outline,
  ),
  project(
    activeIcon: Icons.token,
    inactiveIcon: Icons.token_outlined,
  ),
  history(
    activeIcon: Icons.restore_page_rounded,
    inactiveIcon: Icons.restore_page_outlined,
  ),
  logOut(
    activeIcon: Icons.logout,
    inactiveIcon: Icons.logout,
  );

  IconData activeIcon;
  IconData inactiveIcon;

  const DashboardNavigationType({
    required this.activeIcon,
    required this.inactiveIcon
  });

  String get label {
    switch (this) {
      case DashboardNavigationType.labels:
        return 'Labels';
      case DashboardNavigationType.languages:
        return 'Languages';
      case DashboardNavigationType.context:
        return 'Context';
      case DashboardNavigationType.account:
        return 'Account';
      case DashboardNavigationType.pricePage:
        return 'Pricing';
      case DashboardNavigationType.project:
        return 'Project';
      case DashboardNavigationType.history:
        return 'History';
      case DashboardNavigationType.logOut:
        return 'Log out';
    }
  }

  String? get routeOnClick {
    switch (this) {
      case DashboardNavigationType.labels:
        return '/labels';
      case DashboardNavigationType.languages:
        return '/languages';
      case DashboardNavigationType.context:
        return '/context';
      case DashboardNavigationType.account:
        return '/account';
      case DashboardNavigationType.pricePage:
        return '/pricing-page';
      case DashboardNavigationType.project:
        return '/project';
      case DashboardNavigationType.history:
        return '/history';
      case DashboardNavigationType.logOut:
        return null;
    }
  }
}
''';

      final result = usecase.resolve(input);
      // print(result.greenBright); // Uncomment to see the transformed code in color

      // Check that the result matches the expected output
      expect(result, equals(expectedResult));

      // Check that string fields are removed from constructor calls
      expect(result, isNot(contains('label: \'Labels\'')));
      expect(result, isNot(contains('routeOnClick: \'/labels\'')));

      // Check that non-string fields are preserved
      expect(result, contains('activeIcon: Icons.translate'));
      expect(result, contains('inactiveIcon: Icons.translate_outlined'));

      // Check that string getters are created
      expect(result, contains('String get label {'));
      expect(result, contains('String? get routeOnClick {'));

      // Check that switch statements are created
      expect(result, contains('switch (this) {'));
      expect(result, contains('case DashboardNavigationType.labels:'));
      expect(result, contains('return \'Labels\';'));
      expect(result, contains('return \'/labels\';'));
      expect(result, contains('return null;'));
    });

    test('should not transform enum without hardcoded strings', () {
      const input = '''
enum SimpleEnum {
  value1,
  value2,
  value3;
}
''';

      final result = usecase.resolve(input);

      // Should return the same content
      expect(result, equals(input));
    });

    test('should handle enum with non-string fields only', () {
      const input = '''
enum NumberEnum {
  first(1),
  second(2),
  third(3);

  final int value;

  const NumberEnum(this.value);
}
''';

      final result = usecase.resolve(input);

      // Should return the same content since no string fields
      expect(result, equals(input));
    });

    test('should handle malformed dart code gracefully', () {
      const input = '''
enum Broken {
  invalid syntax here
''';

      final result = usecase.resolve(input);

      // Should return the original content when parsing fails
      expect(result, equals(input));
    });
  });
}
