import 'package:chalkdart/chalkstrings.dart';
import 'package:git/git.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> ensureGitDirectoryIsConfigured({
  required String dirrPath,
}) async {
  final isCurrentDirectoryAGitDirectory = await GitDir.isGitDir(dirrPath);
  // 1. Is git directory?
  if (!isCurrentDirectoryAGitDirectory) {
    return Exception(
      'Current directory is not a git directory.\n'
              'Please create a git repository so you can revert '
              'to the previous state of your project if needed.'
          .red,
    ).toFailure();
  }

  // 2. Is everything commited?
  final gitDir = await GitDir.fromExisting(dirrPath);
  final haveAnyPendingCommit = !(await gitDir.isWorkingTreeClean());
  if (haveAnyPendingCommit) {
    return Exception(
      'You have pending commits in your git directory.\n'
      'Please commit or stash your changes before running this command.',
    ).toFailure();
  }

  // 3. Check if local branch is behind remote
  final syncStatus = await BabelProcessRunner.run(
    command: 'git status -uno',
    dirrPath: dirrPath,
  );
  final statusOutput = syncStatus.stdout.toString();

  if (statusOutput.contains('Your branch is behind')) {
    return Exception(
      'Your local branch is behind the remote branch.\n'
              'Please pull the latest changes before running this command.'
          .red,
    ).toFailure();
  }

  return Success(unit);
}

AsyncResult<CreateFlowEnsureGit> create_ensureGitDirectoryIsConfigured(
  CreateFlowCreatedClient payload,
) async {
  final dirrPath = payload.directoryPath;
  final ensureGitResult = await ensureGitDirectoryIsConfigured(
    dirrPath: dirrPath,
  );

  return ensureGitResult.flatMap((_) {
    return CreateFlowEnsureGit(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
    ).toSuccess();
  });
}
