import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel_core/gobabel_core.dart';

class FileUtils {
  static Future<String> get getBabelTextFile async {
    final Directory libDir = await findLibDirectory;
    final String path = '${libDir.path}/$kBabelFileName';
    return path;
  }

  static Future<Directory> get findLibDirectory async {
    final Directory curr = Dependencies.targetDirectory;
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
}
