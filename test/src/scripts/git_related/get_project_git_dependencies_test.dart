import 'package:gobabel/src/scripts/git_related/get_git_user.dart';
import 'package:gobabel/src/scripts/git_related/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_origin.dart';
import 'package:test/test.dart';

void main() {
  test('get project git dependencies ...', () async {
    final getProjectGitDependenciesUsecase = GetProjectGitDependenciesUsecase(
      getProjectOriginUsecase: GetProjectOriginUsecase(),
      getLastLocalCommitInCurrentBranch:
          GetLastLocalCommitInCurrentBranchUsecase(),
      getGitUserUsecase: GetGitUserUsecase(),
    );
    await getProjectGitDependenciesUsecase();
  });
}
