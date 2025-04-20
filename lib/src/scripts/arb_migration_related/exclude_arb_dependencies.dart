import 'dart:io';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:path/path.dart';

class ExcludeNotUsedAnymoreArbDependenciesUsecase {
  Future<void> call(ArbData? arb) async {
    if (arb == null) return;

    final String arbDirFullPath = join(
      Dependencies.targetDirectory.path,
      arb.config.arbDir,
    );
    if (await Directory(arbDirFullPath).exists()) {
      await Directory(arbDirFullPath).delete(recursive: true);
    }

    final String outputDirFullPath = join(
      Dependencies.targetDirectory.path,
      arb.config.outputDir,
    );
    if (await Directory(outputDirFullPath).exists()) {
      await Directory(outputDirFullPath).delete(recursive: true);
    }
    final String l10nFilePath = join(
      Dependencies.targetDirectory.path,
      arb.config.l10nFileName,
    );
    if (await File(l10nFilePath).exists()) {
      await File(l10nFilePath).delete();
    }
  }
}
