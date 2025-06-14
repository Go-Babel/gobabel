import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';

class GetProjectLastCommitShaStampsUsecase {
  Future<List<ShaCommit>> call({required String projectApiToken}) async {
    final GitVariables gitVariables = Dependencies.gitVariables;
    final shaUpdates = await Dependencies.client.publicProject.getLastShaKeys(
      projectApiToken: projectApiToken,
      projectShaIdentifier: gitVariables.projectShaIdentifier,
    );

    if (shaUpdates == null) {
      throw Exception(
        'Failed to get project dependencies. Please run create command if it\'s a new project. Double-check if your token key is valid and not misstyped.',
      );
    }

    return shaUpdates;
  }
}
