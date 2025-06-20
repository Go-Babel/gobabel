import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

/// Gets eligible files for string extraction from the directory
AsyncResult<List<File>> getEligibleFiles(Directory dir) async {
  Directory lib;
  if (dir.path.endsWith('/lib')) {
    lib = dir;
  } else {
    lib = Directory('${dir.path}lib');
  }

  if (!await lib.exists()) {
    return Exception(
      'The directory does not contain a "lib" folder: ${lib.path}',
    ).toFailure();
  }

  final List<FileSystemEntity> entities =
      await lib.list(recursive: true).toList();
  final result =
      entities.whereType<File>().where((file) {
        // Normalize path separators for consistent splitting, then split into segments
        final pathSegments = p.split(file.path.replaceAll(r'\', '/'));
        for (final segment in pathSegments) {
          final segmentContainExcludeFolder = excludedFolders.any(
            (folder) => segment.contains(folder),
          );

          // ex: .dart_tool
          final segmentContainPrivateFolder =
              segment.contains('/.') || segment.startsWith('.');

          final isFreezedFile = file.path.endsWith('.freezed.dart');
          final isPartFile = file.path.endsWith('.part.dart');
          final isGen = file.path.endsWith('.gen.dart');
          final isGeneratedFile = file.path.endsWith('.g.dart');
          if (segmentContainExcludeFolder ||
              segmentContainPrivateFolder ||
              isFreezedFile ||
              isGen ||
              isPartFile ||
              isGeneratedFile) {
            return false; // Exclude this file
          }
        }

        // Only include Dart files
        return file.path.endsWith('.dart');
      }).toList();

  return result.toSuccess();
}

// List of folders to exclude from scanning
const List<String> excludedFolders = [
  'android',
  'ios',
  'linux',
  'macos',
  'build',
  'web',
  'windows',
  'test',
];
