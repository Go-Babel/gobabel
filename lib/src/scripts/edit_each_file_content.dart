import 'dart:io';
import 'package:console_bars/console_bars.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/gobabel_controller.dart';
import 'package:gobabel_core/gobabel_core.dart';

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
    final desc = "Analysing dart files with potential translation labels";

    final FillingBar? p =
        isInTest
            ? null
            : FillingBar(
              desc: desc,
              total: changedFilesPath.length,
              time: true,
              percentage: true,
            );
    final Directory curr = Dependencies.targetDirectory;
    final dirrPath = curr.path;
    for (final ChangedFilePath filePath in changedFilesPath) {
      final String path = filePath;
      final String directoryFilePath = '$dirrPath/$path';

      await _runForFile(File(directoryFilePath), onDartFileFinded);
      p?.increment();
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
    final List<File> allTargetFiles = await runWithSpinner(() async {
      return await _getAllDartFilesThatNeedToBeAnalysed(curr);
    }, message: 'Retriving all files');
    final desc = "Analysing dart files with potential translation labels";

    final FillingBar? p =
        isInTest
            ? null
            : FillingBar(
              desc: desc,
              total: allTargetFiles.length,
              time: true,
              percentage: true,
            );

    for (final File file in allTargetFiles) {
      p?.increment();

      await _runForFile(file, onDartFileFinded);
    }
  }

  Future<void> _runForFile(
    File file,
    Future<NewString?> Function(
      ContextPath filePath,
      String fileContentAsString,
    )
    onDartFileFinded,
  ) async {
    final bool exists = await file.exists();
    // Ignore if not dart file
    if (!file.path.endsWith('.dart') || !exists) return;

    final String fileContentAsString = await file.readAsString();

    final String filePath = file.path;

    final newFile = await onDartFileFinded(filePath, fileContentAsString);
    if (newFile == null) return;
    await file.writeAsString(newFile);
  }

  Future<List<File>> _getAllDartFilesThatNeedToBeAnalysed(Directory dir) async {
    if (!await dir.exists()) {
      throw FileSystemException("Directory not found", dir.path);
    }

    final List<File> files = [];
    await for (final entity in dir.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        final isInIgnoreFile = entity.path.contains('lib/');
        if (isInIgnoreFile) continue;
        if (entity.path.endsWith('.dart')) {
          files.add(entity);
        }
      }
    }
    return files;
  }
}
