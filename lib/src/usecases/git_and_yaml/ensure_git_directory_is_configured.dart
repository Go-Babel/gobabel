import 'package:git/git.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> ensureGitDirectoryIsConfigured({
  required String dirrPath,
}) async {
  final isCurrentDirectoryAGitDirectory = await GitDir.isGitDir(dirrPath);
  // 1. Is git directory?
  if (!isCurrentDirectoryAGitDirectory) {
    return BabelException(
      title: 'Not a Git repository',
      description: 'The current directory is not a Git repository. '
          'Please initialize a Git repository with "git init" '
          'to enable version control and allow reverting changes if needed.',
    ).toFailure();
  }

  // 2. Is everything commited?
  final gitDir = await GitDir.fromExisting(dirrPath);
  final haveAnyPendingCommit = !(await gitDir.isWorkingTreeClean());
  if (haveAnyPendingCommit) {
    return BabelException(
      title: 'Uncommitted changes detected',
      description: 'You have uncommitted changes in your Git repository. '
          'Please commit your changes with "git commit" or stash them with "git stash" '
          'before running this command to ensure a clean working state.',
    ).toFailure();
  }

  // 3. Check if local branch is behind remote
  final syncStatus = await BabelProcessRunner.run(
    command: 'git status -uno',
    dirrPath: dirrPath,
  );
  final statusOutput = syncStatus.stdout.toString();

  if (statusOutput.contains('Your branch is behind')) {
    return BabelException(
      title: 'Local branch is behind remote',
      description: 'Your local branch is behind the remote branch. '
          'Please pull the latest changes with "git pull" '
          'before running this command to ensure you have the latest code.',
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

AsyncResult<SyncFlowEnsureGit> sync_ensureGitDirectoryIsConfigured(
  SyncFlowCreatedClient payload,
) async {
  final dirrPath = payload.directoryPath;
  final ensureGitResult = await ensureGitDirectoryIsConfigured(
    dirrPath: dirrPath,
  );

  return ensureGitResult.flatMap((_) {
    return SyncFlowEnsureGit(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
    ).toSuccess();
  });
}

AsyncResult<GenerateFlowEnsureGit> generate_ensureGitDirectoryIsConfigured(
  GenerateFlowCreatedClient payload,
) async {
  final dirrPath = payload.directoryPath;
  final ensureGitResult = await ensureGitDirectoryIsConfigured(
    dirrPath: dirrPath,
  );

  return ensureGitResult.flatMap((_) {
    return GenerateFlowEnsureGit(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      client: payload.client,
    ).toSuccess();
  });
}
