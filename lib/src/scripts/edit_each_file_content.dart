import 'dart:io';
import 'package:console_bars/console_bars.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/gobabel_controller.dart';
import 'package:gobabel_core/go_babel_core.dart';

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
    final p = FillingBar(
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
      p.increment();
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
    }, message: 'Uploading new version to Gobabel server');
    final desc = "Analysing dart files with potential translation labels";

    final p = FillingBar(
      desc: desc,
      total: allTargetFiles.length,
      time: true,
      percentage: true,
    );

    for (final File file in allTargetFiles) {
      p.increment();
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
        final isInIgnoreFolder = ignoreFolders.any(
          (folderName) => entity.path.contains('/$folderName/'),
        );
        if (isInIgnoreFolder) continue;
        if (entity.path.endsWith('.dart')) {
          files.add(entity);
        }
      }
    }
    return files;
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
