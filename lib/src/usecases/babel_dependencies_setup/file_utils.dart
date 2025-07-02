import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<String> getBabelTextFile({required Directory curr}) async {
  final libDirResult = await findLibDirectory(curr: curr);
  if (libDirResult.isError()) return libDirResult.asBabelResultErrorAsync();
  final Directory libDir = libDirResult.getOrThrow();
  final String path = '${libDir.path}/$kBabelFileName';
  return path.toSuccess();
}

AsyncBabelResult<Directory> findLibDirectory({required Directory curr}) async {
  FileSystemEntity? libDirectory;

  await for (final FileSystemEntity fileEntity in curr.list()) {
    if (fileEntity is File) continue;
    final f = (fileEntity as Directory);
    if (!f.path.endsWith('lib')) continue;
    libDirectory = f;
  }

  if (libDirectory == null) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'No lib/ directory found',
        description:
            'Could not find a lib/ directory in the project. '
            'Please ensure you are running this command from the root of a Dart/Flutter project '
            'that contains a lib/ directory.',
      ),
    ).toFailure();
  }

  final Directory libDir = libDirectory as Directory;
  return libDir.toSuccess();
}
