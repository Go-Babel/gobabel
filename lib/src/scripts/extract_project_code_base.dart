import 'dart:io';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';
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
    final List<Directory> directories = [];
    bool didFindLib = false;
    final Directory curr = Dependencies.targetDirectory;
    await for (final FileSystemEntity fileEntity in curr.list(
      recursive: true,
    )) {
      if (fileEntity is File) continue;
      final f = (fileEntity as Directory);
      final dirPath = f.path;
      final isInIgnoreFolder = ignoreFolders.any(
        (folderName) => dirPath.contains('/$folderName/'),
      );
      if (isInIgnoreFolder) continue;
      directories.add(f);
      if (f.path.endsWith('lib')) {
        didFindLib = true;
      }
    }

    if (didFindLib == false) {
      throw Exception('❌ lib directory not found'.red);
    }

    final List<CodeBaseFile> files = [];
    final List<CodeBaseFolder> folders = [];
    for (final Directory dirr in directories) {
      await for (final FileSystemEntity fileEntity in dirr.list()) {
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
    }

    final isAllEmpty = files.isEmpty && folders.isEmpty;
    if (isAllEmpty) {
      throw Exception('❌ No dart files found in lib directory'.red);
    }
    return CodeBaseFolder(files: files, folders: folders);
  }

  Future<CodeBaseFolder> _getCodeBaseFolder(Directory dir) async {
    final dirPath = dir.path;
    final isInIgnoreFolder = ignoreFolders.any(
      (folderName) => dirPath.contains('/$folderName/'),
    );
    if (isInIgnoreFolder) {
      return CodeBaseFolder(files: [], folders: []);
    }
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

// Thease are the folders that we want to ignore because we know that they are
// no relevant dart files in them.
final Set<String> ignoreFolders = {
  '.dart_tool',
  '.idea',
  'android',
  'ios',
  'lib',
  'linux',
  'macos',
  'test',
  'web',
  'windows',
};
