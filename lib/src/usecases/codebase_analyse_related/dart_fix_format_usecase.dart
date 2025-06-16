import 'dart:io';

import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> multiDartFixFormatUsecase({
  required String dirrPath,
  required List<File> targetFiles,
}) async {
  if (targetFiles.isEmpty) {
    return Success(unit);
  }

  final Iterable<String> paths = targetFiles.map((e) => e.path);
  try {
    await BabelProcessRunner.run(
      command: 'dart format $paths',
      dirrPath: dirrPath,
    );
    for (final String path in paths) {
      await BabelProcessRunner.run(
        command: 'dart fix --apply $path',
        dirrPath: dirrPath,
      );
    }
    return Success(unit);
  } catch (e, s) {
    return Failure(
      BabelException(
        title: 'Dart Fix Format Error',
        description: 'Failed to apply dart fix and format.\n\n$e\n\n$s',
      ),
    );
  }
}
