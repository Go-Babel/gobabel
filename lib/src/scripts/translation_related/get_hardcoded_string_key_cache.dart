import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';

class GetHardcodedStringKeyCacheUsecase {
  const GetHardcodedStringKeyCacheUsecase();

  Future<void> call({required String projectApiToken}) async {
    final GitVariables gitVariables = Dependencies.gitVariables;

    final cache = await Dependencies.client.publicHardcodedStringKeyCache
        .getByProjectId(
          projectApiToken: projectApiToken,
          projectShaIdentifier: gitVariables.projectShaIdentifier,
        );

    Dependencies.hardcodedStringKeyCache = cache.keyMap;
  }
}
