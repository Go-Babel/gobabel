import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_keyword_usecase.dart';
import 'package:test/test.dart';

void main() {
  group('Should not remove const from varaibles declarations of any type', () {
    test('Should not remove const direct string variables', () {
      final target = '''const _keyThemeMode = 'THEME_MODE';''';

      final result =
          singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
            target,
          );

      expect(result, target);
    });
    test('Should replace const with final for valid user-facing strings', () {
      final target = '''const greeting = 'Hello, world!';''';

      final result =
          singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
            target,
          );

      expect(result, equals('''final greeting = 'Hello, world!';'''));
    });
    test('Should not remove const from lists that contains strings', () {
      final target = '''const listage = ['B', 'K', 'M', 'G', 'T', 'P'];''';

      final result =
          singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
            target,
          );

      expect(result, target); // Single letters don't pass validation
    });
    test('Should not remove const from map that contains strings', () {
      final target = '''const mappable = {'a': 'b'};''';

      final result =
          singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
            target,
          );

      expect(result, target); // Single letters don't pass validation
    });
    test('Should replace const with final for map with valid strings', () {
      final target = '''const translations = {'key': 'Welcome to our app'};''';

      final result =
          singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
            target,
          );

      expect(
        result,
        equals('''final translations = {'key': 'Welcome to our app'};'''),
      );
    });
  });
  group('RemoveConstKeywordUsecase', () {
    test('Should remove const from widget tree that has hardcoded string', () {
      const input = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('Hello, world!'),
      ],
    );
  }
}''';

      const expected = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hello, world!'),
      ],
    );
  }
}''';

      final result =
          singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
            input,
          );
      expect(result, equals(expected));
    });

    test(
      'Should remove const from direct widget that has hardcoded string in his parameters',
      () {
        const input = '''import 'package:flutter/material.dart';

class MyTestWidget2 extends StatelessWidget {
  const MyTestWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () {}, child: const Text('Hardcoded string'));
  }
}''';

        const expected = '''import 'package:flutter/material.dart';

class MyTestWidget2 extends StatelessWidget {
  const MyTestWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () {}, child: Text('Hardcoded string'));
  }
}''';

        final result =
            singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
              input,
            );
        expect(result, equals(expected));
      },
    );

    test(
      'Should remove const from class that are not in a widget tree as well',
      () {
        const input = '''import 'package:flutter/material.dart';

showSnackbar(BuildContext context){
  ScaffoldMessenger.of(
        context,
  ).showSnackBar(const SnackBar(content: Text('This is a test')));
}
''';

        const expected = '''import 'package:flutter/material.dart';

showSnackbar(BuildContext context){
  ScaffoldMessenger.of(
        context,
  ).showSnackBar(SnackBar(content: Text('This is a test')));
}
''';

        final result =
            singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
              input,
            );
        expect(result, equals(expected));
      },
    );

    test(
      'Should not remove the consts from widgets that do not have hardcoded strings',
      () {
        const input = '''import 'package:flutter/material.dart';

class OwnerDidNotPaidPage extends StatelessWidget {
  const OwnerDidNotPaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text('Ops...', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16),
          const SizedBox(
            width: 300,
            child: Text('Something went wrong, please try again later.'),
          ),
        ],
      ),
    );
  }
}''';

        const expected = '''import 'package:flutter/material.dart';

class OwnerDidNotPaidPage extends StatelessWidget {
  const OwnerDidNotPaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text('Ops...', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16),
          SizedBox(
            width: 300,
            child: Text('Something went wrong, please try again later.'),
          ),
        ],
      ),
    );
  }
}''';

        final result =
            singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
              input,
            );
        expect(result, equals(expected));
      },
    );

    test(
      'Should ONLY remove const from where there is a hardcoded string in hierarchy',
      () {
        /// Note: This test is designed to ensure that only the const keyword
        /// is removed from the Row widget that in its children has a Text widget
        /// with a hardcoded string. The const keyword in the Icon widget should remain, and no hardcoded strings, should remain the same.
        const input = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(children: [Text('Hello, world!')]),
        const Row(children: [Icon(Icons.star)]),
      ],
    );
  }
}''';

        const expected = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [Text('Hello, world!')]),
        const Row(children: [Icon(Icons.star)]),
      ],
    );
  }
}''';

        final result =
            singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
              input,
            );
        expect(result, equals(expected));
      },
    );

    test(
      'Even with a deep hierarchy, where the hardcoded is very deep, it should still remove const only from the class that has the hardcoded string in hierarchy',
      () {
        /// Note: This test is designed to ensure that only the const keyword
        /// is removed from the Row widget that in its children has a Text widget
        /// with a hardcoded string. The const keyword in the Icon widget should remain, and no hardcoded strings, should remain the same.
        const input = '''import 'package:flutter/material.dart';

class DeepHierarcyWithHardcodedStrings extends StatelessWidget {
  const DeepHierarcyWithHardcodedStrings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.blue,
              child: Row(children: [Text('Hello, world!')]),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class DeepHierarcyWithoutHardcodedStrings extends StatelessWidget {
  const DeepHierarcyWithoutHardcodedStrings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.blue,
              child: Row(children: [Icon(Icons.star)]),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}''';

        const expected = '''import 'package:flutter/material.dart';

class DeepHierarcyWithHardcodedStrings extends StatelessWidget {
  const DeepHierarcyWithHardcodedStrings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.blue,
              child: Row(children: [Text('Hello, world!')]),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class DeepHierarcyWithoutHardcodedStrings extends StatelessWidget {
  const DeepHierarcyWithoutHardcodedStrings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.blue,
              child: Row(children: [Icon(Icons.star)]),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}''';

        final result =
            singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
              input,
            );
        expect(result, equals(expected));
      },
    );

    test('Should handle class in a switch as expected', () {
      const input =
          '''// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';

class TestSwitchInBuilder extends StatelessWidget {
  final int index;
  const TestSwitchInBuilder({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const ColoredBox(
              color: Colors.blue,
              child: Row(children: [Text('Hello, world!')]),
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) {
                switch (index) {
                  case 0:
                    return const ColoredBox(
                      color: Colors.purple,
                      child: Center(child: Text('Label flag')),
                    );
                  case 1:
                    return const ColoredBox(
                      color: Colors.red,
                      child: Center(child: Text('Label country')),
                    );
                  case 2:
                    return const ColoredBox(
                      color: Colors.orange,
                      child: Center(child: Text('Label locale')),
                    );
                  case 3:
                    return const ColoredBox(
                      color: Colors.black,
                      child: Center(child: Text('Locale code')),
                    );
                  case 4:
                    return const ColoredBox(
                      color: Colors.pink,
                      child: Center(child: Text('Key Label')),
                    );
                  case 5:
                    return const ColoredBox(
                      color: Colors.purple,
                      child: Center(child: Text('Content Label')),
                    );
                  case 6:
                    return const ColoredBox(
                      color: Colors.purple,
                      child: Center(child: Icon(Icons.start)),
                    );
                  default:
                    return const ColoredBox(
                      color: Colors.grey,
                      child: Center(child: Text('Unknown index')),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}''';

      const expected =
          '''// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';

class TestSwitchInBuilder extends StatelessWidget {
  final int index;
  const TestSwitchInBuilder({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.blue,
              child: Row(children: [Text('Hello, world!')]),
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) {
                switch (index) {
                  case 0:
                    return ColoredBox(
                      color: Colors.purple,
                      child: Center(child: Text('Label flag')),
                    );
                  case 1:
                    return ColoredBox(
                      color: Colors.red,
                      child: Center(child: Text('Label country')),
                    );
                  case 2:
                    return ColoredBox(
                      color: Colors.orange,
                      child: Center(child: Text('Label locale')),
                    );
                  case 3:
                    return ColoredBox(
                      color: Colors.black,
                      child: Center(child: Text('Locale code')),
                    );
                  case 4:
                    return ColoredBox(
                      color: Colors.pink,
                      child: Center(child: Text('Key Label')),
                    );
                  case 5:
                    return ColoredBox(
                      color: Colors.purple,
                      child: Center(child: Text('Content Label')),
                    );
                  case 6:
                    return const ColoredBox(
                      color: Colors.purple,
                      child: Center(child: Icon(Icons.start)),
                    );
                  default:
                    return ColoredBox(
                      color: Colors.grey,
                      child: Center(child: Text('Unknown index')),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}''';

      final result =
          singleRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy(
            input,
          );
      expect(result, equals(expected));
    });
  });
}
