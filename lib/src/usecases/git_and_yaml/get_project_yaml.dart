import 'dart:io';

import 'package:collection/collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<String> getProjectYaml({
  required Directory currentDirectory,
}) async {
  const String targetFile = 'pubspec.yaml';

  try {
    final List<FileSystemEntity> items = currentDirectory.listSync(
      recursive: false,
      followLinks: false,
    );

    final yamlFile = items.firstWhereOrNull(
      (element) => element.path.endsWith(targetFile),
    );

    if (yamlFile == null) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'pubspec.yaml not found',
          description:
              'No "pubspec.yaml" file found in the current directory. '
              'Please ensure you are in a Flutter/Dart project directory. '
              'Run this command from your project root where the pubspec.yaml is located.',
        ),
      ).toFailure();
    }

    try {
      final content = await File(yamlFile.path).readAsString();
      return content.toSuccess();
    } catch (e) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Failed to read pubspec.yaml',
          description:
              'Could not read the pubspec.yaml file. '
              'Please check if the file exists and you have read permissions. '
              'Error details: $e',
        ),
      ).toFailure();
    }
  } catch (e) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Directory access error',
        description:
            'Failed to list directory contents. '
            'Please check if you have proper permissions to access this directory. '
            'Error details: $e',
      ),
    ).toFailure();
  }
}
