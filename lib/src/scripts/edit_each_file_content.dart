import 'dart:io';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel_core/go_babel_core.dart';

typedef NewString = String;

class RunForEachFileTextUsecase {
  Future<void> call({
    required Future<NewString?> Function(
      ContextPath filePath,
      String fileContentAsString,
    )
    onDartFileFinded,
  }) async {
    final fileVerification = Dependencies.filesVerificationState;
    if (fileVerification == null) {
      throw Exception(
        'Internal package error. Did not find the file verification state. Please report this issue.',
      );
    }
    await fileVerification.when(
      fromZero: () => _runForAllFiles(onDartFileFinded),
      fromLastCommit: (c) => _runForOnlyTargetFiles(c, onDartFileFinded),
    );
  }

  Future<void> _runForOnlyTargetFiles(
    List<ChangedFilePath> changedFilesPath,
    Future<NewString?> Function(
      ContextPath filePath,
      String fileContentAsString,
    )
    onDartFileFinded,
  ) async {
    final Directory curr = Dependencies.targetDirectory;
    final dirrPath = curr.path;
    for (final ChangedFilePath filePath in changedFilesPath) {
      final String path = filePath;
      final String directoryFilePath = '$dirrPath/$path';

      await _runForDir(File(directoryFilePath), onDartFileFinded);
    }
  }

  Future<void> _runForAllFiles(
    Future<NewString?> Function(
      ContextPath filePath,
      String fileContentAsString,
    )
    onDartFileFinded,
  ) async {
    final Directory curr = Dependencies.targetDirectory;
    final List<FileSystemEntity> allSystemEntities = [];
    await for (final FileSystemEntity fileEntity in curr.list()) {
      if (fileEntity is File) continue;
      final f = (fileEntity as Directory);
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
    Future<NewString?> Function(
      ContextPath filePath,
      String fileContentAsString,
    )
    onFileFinded,
  ) async {
    if (entity is File) {
      final File file = entity;
      final bool exists = await file.exists();
      // Ignore if not dart file
      if (!file.path.endsWith('.dart') || !exists) return;

      final String fileContentAsString = await file.readAsString();
      final String filePath = file.path;
      final newFile = await onFileFinded(filePath, fileContentAsString);
      if (newFile == null) return;
      await file.writeAsString(newFile);
    } else {
      final Directory dir = entity as Directory;
      await for (final FileSystemEntity entity in dir.list()) {
        await _runForDir(entity, onFileFinded);
      }
    }
  }
}
