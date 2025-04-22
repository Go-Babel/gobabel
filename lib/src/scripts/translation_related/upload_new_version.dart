import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_client/gobabel_client.dart';

class UploadNewVersionUsecase {
  Future<void> call({
    required String token,
    required Set<String> projectCodeBaseFolders,
  }) async {
    final GitVariables gitVariables = Dependencies.gitVariables;

    await Dependencies.client.translations.updateTranslations(
      token: token,
      projectCodeBaseFolders: projectCodeBaseFolders,
      madeTranslations: Dependencies.madeTranslations,
      projectShaIdentifier: gitVariables.projectShaIdentifier,
      currentCommitSha: gitVariables.latestShaIdentifier,
      pathsOfKeys: ArbKeysAppearancesPath(
        pathAppearancesPerKey: Dependencies.pathAppearancesPerKey,
      ),
    );
  }
}
