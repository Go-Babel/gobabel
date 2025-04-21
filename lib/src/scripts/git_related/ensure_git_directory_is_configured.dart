import 'package:chalkdart/chalkstrings.dart';
import 'package:git/git.dart';
import 'package:path/path.dart' as path;

class EnsureGitDirectoryIsConfiguredUsecase {
  const EnsureGitDirectoryIsConfiguredUsecase();
  Future<void> call() async {
    final isCurrentDirectoryAGitDirectory = await GitDir.isGitDir(path.current);
    if (isCurrentDirectoryAGitDirectory) {
      throw Exception(
        '❌ Current directory is not a git directory.\n'
                'Please create a git repository so you can revert '
                'to the previous state of your project if needed.'
            .red,
      );
    }

    final gitDir = await GitDir.fromExisting(path.current);
    final haveAnyPendingCommit = !(await gitDir.isWorkingTreeClean());
    if (haveAnyPendingCommit) {
      throw Exception(
        '❌ You have pending commits in your git directory.\n'
                'Please commit or stash your changes before running this command.'
            .red,
      );
    }
  }
}
