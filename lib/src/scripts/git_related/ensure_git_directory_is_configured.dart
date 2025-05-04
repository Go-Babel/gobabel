import 'package:chalkdart/chalkstrings.dart';
import 'package:git/git.dart';
import 'package:gobabel/src/core/dependencies.dart';

class EnsureGitDirectoryIsConfiguredUsecase {
  const EnsureGitDirectoryIsConfiguredUsecase();
  Future<void> call() async {
    final dirrPath = Dependencies.targetDirectory.path;
    final isCurrentDirectoryAGitDirectory = await GitDir.isGitDir(dirrPath);

    if (!isCurrentDirectoryAGitDirectory) {
      throw Exception(
        'Current directory is not a git directory.\n'
                'Please create a git repository so you can revert '
                'to the previous state of your project if needed.'
            .red,
      );
    }
    final gitDir = await GitDir.fromExisting(dirrPath);
    final haveAnyPendingCommit = !(await gitDir.isWorkingTreeClean());
    if (haveAnyPendingCommit) {
      throw Exception(
        'You have pending commits in your git directory.\n'
                'Please commit or stash your changes before running this command.'
            .red,
      );
    }
  }
}
