import 'dart:io';

import 'package:gobabel_client/gobabel_client.dart';

class ExtractProjectCodeBaseUsecase {
  /*
  Save each folder/file in a map structure (inside lib)
  Example:
  {
    'lib': {
      'src': {
        'core': {
          'dependencies.dart': 'content',
          'type_defs.dart': 'content',
        },
        'scripts': {
          'extract_project_code_base.dart': 'content',
          'notify_aibabel_api_about_new_version.dart': 'content',
        },
      },
    },
  }
  */
  Future<CodeBaseFolder> call() async {
    CodeBaseFolder? lib;
    Directory? libDirr;

    final Directory curr = Directory.current;
    await for (final FileSystemEntity fileEntity in curr.list()) {
      if (fileEntity is File) continue;
      final f = (fileEntity as Directory);
      if (!f.path.endsWith('lib')) continue;
      libDirr = f;
      break;
    }

    if (libDirr == null) {
      throw Exception('lib directory not found');
    }

    await for (final FileSystemEntity fileEntity in libDirr.list()) {
      final List<CodeBaseFile> files = [];
      final List<CodeBaseFolder> folders = [];
      if (fileEntity is File) {
        if (!fileEntity.path.endsWith('.dart')) continue;
        final fileName =
            fileEntity.path.contains('/')
                ? fileEntity.path.split('/').last
                : fileEntity.path;
        files.add(CodeBaseFile(fileName: fileName));
      } else {
        final Directory dir = fileEntity as Directory;
        final folder = await _getCodeBaseFolder(dir);
        folders.add(folder);
      }
      lib = CodeBaseFolder(files: files, folders: folders);
    }

    if (lib == null) {
      throw Exception('No folders/files found in lib directory');
    }

    return lib;
  }

  Future<CodeBaseFolder> _getCodeBaseFolder(Directory dir) async {
    final List<CodeBaseFile> files = [];
    final List<CodeBaseFolder> folders = [];
    await for (final FileSystemEntity fileEntity in dir.list()) {
      if (fileEntity is File) {
        if (!fileEntity.path.endsWith('.dart')) continue;
        final fileName =
            fileEntity.path.contains('/')
                ? fileEntity.path.split('/').last
                : fileEntity.path;
        files.add(CodeBaseFile(fileName: fileName));
      } else {
        final Directory dir = fileEntity as Directory;
        final folder = await _getCodeBaseFolder(dir);
        folders.add(folder);
      }
    }
    return CodeBaseFolder(files: files, folders: folders);
  }
}
