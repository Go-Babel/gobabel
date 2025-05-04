import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel_core/gobabel_core.dart';

class ExtractProjectCodeBaseUsecase {
  Future<Set<String>> call() async {
    final path = Dependencies.targetDirectory.path;
    final libDir = Directory('$path/lib');
    final target = await buildFolderTree(libDir);
    if (target == null) {
      throw Exception('Target directory not found');
    }

    return target.listAllFolders();
  }
}
