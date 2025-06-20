import 'dart:io';

import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<String> getBabelTextFile({required Directory curr}) async {
  final libDirResult = await findLibDirectory(curr: curr);
  if (libDirResult.isError()) return libDirResult.asErrorAsync();
  final Directory libDir = libDirResult.getOrThrow();
  final String path = '${libDir.path}/$kBabelFileName';
  return path.toSuccess();
}

AsyncResult<Directory> findLibDirectory({required Directory curr}) async {
  FileSystemEntity? libDirectory;

  await for (final FileSystemEntity fileEntity in curr.list()) {
    if (fileEntity is File) continue;
    final f = (fileEntity as Directory);
    if (!f.path.endsWith('lib')) continue;
    libDirectory = f;
  }

  if (libDirectory == null) {
    return Exception('No lib/ directory found').toFailure();
  }

  final Directory libDir = libDirectory as Directory;
  return libDir.toSuccess();
}
