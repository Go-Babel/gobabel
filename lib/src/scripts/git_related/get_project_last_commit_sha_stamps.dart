import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';

class GetProjectLastCommitShaStampsUsecase {
  Future<void> call({required String token}) async {
    final GitVariables gitVariables = Dependencies.gitVariables;
    final shaUpdates = await Dependencies.client.syncProject.getLastUpdateSha(
      token: token,
      projectShaIdentifier: gitVariables.projectShaIdentifier,
    );

    if (shaUpdates == null) {
      throw Exception(
        'Failed to get project dependencies. Please run sync command if it\'s a new project. Double-check if your token key is valid and not misstyped.',
      );
    }

    Dependencies.versionsShas = shaUpdates;
  }
}
