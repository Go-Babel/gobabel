import 'dart:io';
import 'package:gobabel_core/go_babel_core.dart';

typedef NewString = String;

class RunForEachFileTextUsecase {
  Future<void> call({
    required Future<NewString> Function(
      ContextPath filePath,
      String fileContentAsString,
    )
    onDartFileFinded,
  }) async {
    final Directory curr = Directory.current;
    final List<FileSystemEntity> allSystemEntities = [];
    await for (final FileSystemEntity fileEntity in curr.list()) {
      if (fileEntity is File) continue;
      final f = (fileEntity as Directory);
      if (!f.path.endsWith('lib')) continue;
      await for (final FileSystemEntity fileEntity in f.list()) {
        if (fileEntity is File) {
          allSystemEntities.add(fileEntity);
        }
      }
    }

    for (final FileSystemEntity entity in allSystemEntities) {
      await _runForDir(entity, onDartFileFinded);
    }
  }

  /// Recursive function to run [onFileFinded] for each file string in [dir]
  /// All [entity.children] are already loaded
  Future<void> _runForDir(
    FileSystemEntity entity,
    Future<NewString> Function(ContextPath filePath, String fileContentAsString)
    onFileFinded,
  ) async {
    if (entity is File) {
      final File file = entity;
      // Ignore if not dart file
      if (!file.path.endsWith('.dart')) return;

      final String fileContentAsString = await file.readAsString();
      final String filePath = file.path;
      final newFile = await onFileFinded(filePath, fileContentAsString);
      await file.writeAsString(newFile);
    } else {
      final Directory dir = entity as Directory;
      await for (final FileSystemEntity entity in dir.list()) {
        await _runForDir(entity, onFileFinded);
      }
    }
  }
}
