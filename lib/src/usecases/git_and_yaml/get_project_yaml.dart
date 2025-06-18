import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:collection/collection.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<String> getProjectYaml({
  required Directory currentDirectory,
}) async {
  const String targetFile = 'pubspec.yaml';

  final List<FileSystemEntity> items = currentDirectory.listSync(
    recursive: false,
    followLinks: false,
  );

  final yamlFile = items.firstWhereOrNull(
    (element) => element.path.endsWith(targetFile),
  );

  if (yamlFile == null) {
    return Exception(
      '❌ No "pubspec.yaml" file found.\nPlease ensure you are in a flutter/dart project directory.'
          .red,
    ).toFailure();
  }

  return (await File(yamlFile.path).readAsString()).toSuccess();
}
