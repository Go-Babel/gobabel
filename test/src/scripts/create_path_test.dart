import 'dart:io';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:test/test.dart';

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
