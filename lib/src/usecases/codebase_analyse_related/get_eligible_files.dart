import 'dart:io';

import 'package:gobabel_client/gobabel_client.dart';
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
    return BabelException(
      title: 'Missing lib Directory',
      description:
          'The directory does not contain a "lib" folder: ${lib.path}\n\n'
          'GoBabel requires a standard Dart project structure with a "lib" directory.\n\n'
          'Expected structure:\n'
          '${dir.path}/\n'
          '└── lib/\n'
          '    └── src/\n'
          '        └── your_code.dart\n\n'
          'Please ensure you are running GoBabel from the project root directory.',
    ).toFailure();
  }

  final List<FileSystemEntity> entities =
      await lib.list(recursive: true).toList();
  final result =
      entities.whereType<File>().where((file) {
        // Check file extensions first
        final isFreezedFile = file.path.endsWith('.freezed.dart');
        final isPartFile = file.path.endsWith('.part.dart');
        final isGen = file.path.endsWith('.gen.dart');
        final isGeneratedFile = file.path.endsWith('.g.dart');
        
        if (isFreezedFile || isGen || isPartFile || isGeneratedFile) {
          return false; // Exclude generated files
        }
        
        // Only process Dart files
        if (!file.path.endsWith('.dart')) {
          return false;
        }
        
        // Normalize path separators for consistent splitting, then split into segments
        final pathSegments = p.split(file.path.replaceAll(r'\', '/'));
        for (final segment in pathSegments) {
          final segmentContainExcludeFolder = excludedFolders.any(
            (folder) => segment == folder,
          );

          // ex: .dart_tool
          final segmentContainPrivateFolder = segment.startsWith('.');

          if (segmentContainExcludeFolder || segmentContainPrivateFolder) {
            return false; // Exclude this file
          }
        }

        return true;
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
