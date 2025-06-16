import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_lists_that_contain_hardcoded_strings.dart';
import 'package:test/test.dart';

void main() {
  test('Should return expected value', () async {
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
}
