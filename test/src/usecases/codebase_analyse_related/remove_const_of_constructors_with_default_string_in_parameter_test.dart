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

  test('Should return empty string for empty input', () {
    final expected =
        '''// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gobabel_flutter/babel_text.dart';

class MyTestWidget extends StatelessWidget {
  final String title;
  MyTestWidget({super.key, String? title}) : title = title ?? 'Welcome!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)));
  }
}

class TestHardcodedFile extends StatelessWidget {
  final String userName;
  TestHardcodedFile({super.key, String? userName})
    : userName = userName ?? 'Tom Hanks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Babel.helloUserMessage(userName))),
    );
  }
}
''';
    final result =
        singleFileRemoveConstOfConstructorsWithDefaultStringInParameter(
          bigFileTest1,
        );
    print(result);
    expect(result, expected);
  });
}

final String bigFileTest1 =
    '''// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gobabel_flutter/babel_text.dart';

class MyTestWidget extends StatelessWidget {
  final String title;
  const MyTestWidget({super.key, String? title}) : title = title ?? 'Welcome!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)));
  }
}

class TestHardcodedFile extends StatelessWidget {
  final String userName;
  const TestHardcodedFile({super.key, String? userName})
    : userName = userName ?? 'Tom Hanks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Babel.helloUserMessage(userName))),
    );
  }
}
''';
