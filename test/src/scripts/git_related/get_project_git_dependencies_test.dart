import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:test/test.dart';

void main() {
  test('get project git dependencies ...', () async {
    final getProjectGitDependenciesUsecase = GetProjectGitDependenciesUsecase();
    await getProjectGitDependenciesUsecase();
  });
}
