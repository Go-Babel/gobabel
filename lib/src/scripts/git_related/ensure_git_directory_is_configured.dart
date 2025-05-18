import 'package:chalkdart/chalkstrings.dart';
import 'package:git/git.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';

class EnsureGitDirectoryIsConfiguredUsecase {
  const EnsureGitDirectoryIsConfiguredUsecase();
  Future<void> call() async {
    final dirrPath = Dependencies.targetDirectory.path;
    final isCurrentDirectoryAGitDirectory = await GitDir.isGitDir(dirrPath);
    // 1. Is git directory?
    if (!isCurrentDirectoryAGitDirectory) {
      throw Exception(
        'Current directory is not a git directory.\n'
                'Please create a git repository so you can revert '
                'to the previous state of your project if needed.'
            .red,
      );
    }

    // 2. Is everything commited?
    final gitDir = await GitDir.fromExisting(dirrPath);
    final haveAnyPendingCommit = !(await gitDir.isWorkingTreeClean());
    if (haveAnyPendingCommit) {
      throw Exception(
        'You have pending commits in your git directory.\n'
        'Please commit or stash your changes before running this command.',
      );
    }

    // 3. Check if local branch is behind remote
    final syncStatus = await BabelProcessRunner.run('git status -uno');
    final statusOutput = syncStatus.stdout.toString();

    if (statusOutput.contains('Your branch is behind')) {
      throw Exception(
        'Your local branch is behind the remote branch.\n'
                'Please pull the latest changes before running this command.'
            .red,
      );
    }
  }
}
