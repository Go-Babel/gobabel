import 'dart:io';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:test/test.dart';

import '../../utls/dependencies_class_binding.dart';

void main() {
  setUpAll(() {
    setDependenciesMock();
    Dependencies.setTargetDirectory(
      Directory('/Users/igormidev/go_babel_app/gobabel_flutter/'),
    );
  });
  test('Should commit as expected', () async {
    final result = await BabelProcessRunner.run(
      'git log --reverse --pretty=format:"%H" --date=short',
    );

    final output = result.stdout as String;
    print(output);
    // final usecase = CommitAllChangesUsecase();
    // await usecase();
  });
}
