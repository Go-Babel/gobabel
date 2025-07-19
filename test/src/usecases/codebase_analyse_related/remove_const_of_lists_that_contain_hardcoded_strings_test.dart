import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_lists_that_contain_hardcoded_strings.dart';
import 'package:test/test.dart';

void main() {
  test('Should remove const of lists with unique value', () async {
    final target = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text('Hello, world!'),
      ],
    );
  }
}''';

    final expected = '''import 'package:flutter/material.dart';

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
        singleRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
          target,
        );
    expect(result, expected);
  });

  test('should handle const with generics in constructor calls', () {
    const input = '''
const Map<String, int> scores = const <String, int>{'a': 1, 'b': 2};
const List<Widget> widgets = const <Widget>[const Text('test')];
''';
    const expected =
        '''Map<String, int> scores =  <String, int>{'a': 1, 'b': 2};
List<Widget> widgets = <Widget>[ Text('test')];
''';

    final result =
        singleRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
          input,
        );
    expect(result, equals(expected));
  });

  test('Should remove const of lists with multiple value', () async {
    final target = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(
          text: 'Login',
          icon: Icon(Icons.login),
        ),
        Tab(
          text: 'Sign In',
          icon: Icon(Icons.person_add),
        ),
        Tab(
          text: 'Password Reset',
          icon: Icon(Icons.vpn_key),
        ),
      ],
    );
  }
}''';

    final expected = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          text: 'Login',
          icon: Icon(Icons.login),
        ),
        Tab(
          text: 'Sign In',
          icon: Icon(Icons.person_add),
        ),
        Tab(
          text: 'Password Reset',
          icon: Icon(Icons.vpn_key),
        ),
      ],
    );
  }
}''';
    final result =
        singleRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
          target,
        );
    expect(result, expected);
  });
}
