import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel_core/gobabel_core.dart';

class ExtractProjectCodeBaseUsecase {
  Future<Set<String>> call() async {
    final target = await buildFolderTree(Dependencies.targetDirectory);
    if (target == null) {
      throw Exception('Target directory not found');
    }

    return target.listAllFolders();
  }
}
