import 'dart:io';
import 'package:chalkdart/chalkstrings.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

class CodeBaseFolder {
  final String name;
  final List<CodeBaseFolder> subFolders;

  const CodeBaseFolder({required this.name, required this.subFolders});

  List<String> listAllFolders() {
    final allFolders = <String>[];
    final root = '$name/';
    allFolders.add(root);
    for (final subFolder in subFolders) {
      allFolders.addAll(subFolder.listAllFolders().map((e) => '$root$e'));
    }
    return allFolders;
  }
}

/// Recursively builds a [CodeBaseFolder] representing the directory tree rooted
/// at [dir], including only directories that contain at least one .dart file
/// (directly or in any of their subdirectories).
///
///
/// Returns `null` if [dir] and all its descendants contain no .dart files.
Future<CodeBaseFolder?> buildFolderTree(Directory dir) async {
  final folderName = p.basename(dir.path);
  bool hasDartFile = false;
  final children = <CodeBaseFolder>[];

  await for (final entity in dir.list(followLinks: false)) {
    if (entity is File && p.extension(entity.path) == '.dart') {
      hasDartFile = true;
    } else if (entity is Directory) {
      final child = await buildFolderTree(entity);
      if (child != null) {
        children.add(child);
      }
    }
  }

  if (hasDartFile || children.isNotEmpty) {
    return CodeBaseFolder(name: folderName, subFolders: children);
  }
  return null;
}

/// Synchronous variant that filters similarly.
CodeBaseFolder? buildFolderTreeSync(Directory dir) {
  final folderName = p.basename(dir.path);
  bool hasDartFile = false;
  final children = <CodeBaseFolder>[];

  for (final entity in dir.listSync(followLinks: false)) {
    if (entity is File && p.extension(entity.path) == '.dart') {
      hasDartFile = true;
    } else if (entity is Directory) {
      final child = buildFolderTreeSync(entity);
      if (child != null) {
        children.add(child);
      }
    }
  }

  if (hasDartFile || children.isNotEmpty) {
    return CodeBaseFolder(name: folderName, subFolders: children);
  }
  return null;
}

/// Example usage:
void main() {
  test('should map repo as expected', () async {
    // Suppose you collected all the Dart files in your project:
    final projectDir = Directory.current;

    final codebaseTree = await buildFolderTree(projectDir);

    void printFolder(CodeBaseFolder folder, {int padding = 0}) {
      final paddingStr = ' ' * padding;
      for (final subFolder in folder.subFolders) {
        print(
          '$paddingStr${subFolder.name} (${subFolder.subFolders.length} sub folders)',
        );
        printFolder(subFolder, padding: padding + 2);
      }
    }

    print('Codebase tree:');
    printFolder(codebaseTree!);
    print('Codebase listage:');
    final allFolders = codebaseTree.listAllFolders();
    print(allFolders.join('\n').red);
  });
}
