import 'package:gobabel/src/core/type_defs.dart';
import 'package:git/git.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

class EnsureGitDirectoryIsConfiguredUsecase {
  const EnsureGitDirectoryIsConfiguredUsecase();
  AsyncBabelResult<Unit> call() async {
    final isCurrentDirectoryAGitDirectory = await GitDir.isGitDir(p.current);
    if (isCurrentDirectoryAGitDirectory) {
      return Failure(
        'Current directory is not a git directory.\n'
        'Please create a git repository so you can revert '
        'to the previous state of your project if needed.',
      );
    }

    final gitDir = await GitDir.fromExisting(p.current);
    final haveAnyPendingCommit = !(await gitDir.isWorkingTreeClean());
    if (haveAnyPendingCommit) {
      return Failure(
        'You have pending commits in your git directory.\n'
        'Please commit or stash your changes before running this command.',
      );
    }

    return Success(unit);
  }
}
