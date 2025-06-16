import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_constructors_with_default_string_in_parameter.dart';
import 'package:test/test.dart';

void main() {
  test('Should return expected value', () {
    final target = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  final String title;
  const MyTestWidget({
    super.key,
    this.title = 'Welcome!',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}''';

    final expected = '''import 'package:flutter/material.dart';

class MyTestWidget extends StatelessWidget {
  final String title;
  MyTestWidget({
    super.key,
    this.title = 'Welcome!',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}''';

    final result =
        singleFileRemoveConstOfConstructorsWithDefaultStringInParameter(target);
    print(result);
    expect(result, expected);
  });
}
