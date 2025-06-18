import 'dart:io';

import 'package:gobabel_core/gobabel_core.dart';

Future<String> getBabelTextFile({required Directory curr}) async {
  final Directory libDir = await findLibDirectory(curr: curr);
  final String path = '${libDir.path}/$kBabelFileName';
  return path;
}

Future<Directory> findLibDirectory({required Directory curr}) async {
  FileSystemEntity? libDirectory;

  await for (final FileSystemEntity fileEntity in curr.list()) {
    if (fileEntity is File) continue;
    final f = (fileEntity as Directory);
    if (!f.path.endsWith('lib')) continue;
    libDirectory = f;
  }

  if (libDirectory == null) {
    throw Exception('No lib/ directory found');
  }

  final Directory libDir = libDirectory as Directory;
  return libDir;
}
