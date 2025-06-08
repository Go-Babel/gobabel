import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';

class GetHardcodedStringKeyCacheUsecase {
  const GetHardcodedStringKeyCacheUsecase();

  Future<void> call({required String projectApiToken}) async {
    final GitVariables gitVariables = Dependencies.gitVariables;

    final cache = await Dependencies.client.publicHardcodedStringKeyCache
        .getByProjectId(
          projectShaIdentifier: gitVariables.projectShaIdentifier,
        );

    if (cache == null) {
      throw Exception(
        '❌ No hardcoded string key cache found for project with sha identifier: ${gitVariables.projectShaIdentifier}. '
        'Please ensure the project has been created and the cache has been generated.',
      );
    }

    Dependencies.hardcodedStringKeyCache = cache.keyMap;
  }
}
