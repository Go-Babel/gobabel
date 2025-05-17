// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_git_user.dart';
import 'package:gobabel/src/scripts/git_related/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/scripts/git_related/get_project_origin.dart';
import 'package:gobabel_client/gobabel_client.dart';

class GetProjectGitDependenciesUsecase {
  final GetLastLocalCommitInCurrentBranchUsecase
  getLastLocalCommitInCurrentBranch;
  final GetGitUserUsecase _getGitUserUsecase;
  final GetProjectOriginUsecase _getProjectOriginUsecase;
  GetProjectGitDependenciesUsecase({
    required GetGitUserUsecase getGitUserUsecase,
    required GetLastLocalCommitInCurrentBranchUsecase
    getLastLocalCommitInCurrentBranch,
    required GetProjectOriginUsecase getProjectOriginUsecase,
  }) : _getGitUserUsecase = getGitUserUsecase,
       getLastLocalCommitInCurrentBranch = getLastLocalCommitInCurrentBranch,
       _getProjectOriginUsecase = getProjectOriginUsecase;
  Future<void> call() async {
    try {
      // Use the appropriate shell based on the platform
      String shell = Platform.isWindows ? 'cmd' : 'sh';
      List<String> shellArgs;

      if (Platform.isWindows) {
        // Windows doesn't have 'head' natively; assuming Git Bash or WSL
        shellArgs = ['/c', 'git rev-list --parents --reverse HEAD | head -2'];
      } else {
        // Unix-like systems (Linux, macOS)
        shellArgs = ['-c', 'git rev-list --parents --reverse HEAD | head -2'];
      }

      final dirrPath = Dependencies.targetDirectory.path;
      // Run the command
      final ProcessResult result = await Process.run(
        shell,
        shellArgs,
        workingDirectory: dirrPath,
      );
      final shas = '${result.stdout}'.trim().split('\n');
      if (shas.length < 2) {
        throw Exception(
          'Your project should have at least 2 commits.\nCommits SHA are used as a unique identifier of your project in gobabel system.\nAlso, check if you are in the correct path: $dirrPath',
        );
      }
      final projectShaIdentifierText = shas[1].trim().replaceAll(' ', '');
      final BigInt projectShaIdentifier = BigInt.parse(
        projectShaIdentifierText,
        radix: 16,
      );
      final latestShaIdentifier = shas[0].trim();
      final lastCommit = await getLastLocalCommitInCurrentBranch();

      final GitUser user = await _getGitUserUsecase();

      final String originUrl = await _getProjectOriginUsecase();
      Dependencies.gitVariables = GitVariables(
        user: user,
        previousCommit: lastCommit,
        originUrl: originUrl,
        latestShaIdentifier: latestShaIdentifier,
        projectShaIdentifier: projectShaIdentifier,
      );
    } catch (e, s) {
      throw Exception(
        'Failed to get project dependencies. Please run create command if it\'s a new project. Double-check if your token key is valid and not misstyped.\n\nDETAILS:\n${'$e'.replaceAll('Exception: ', '')}\n$s'
            .red,
      );
    }
  }
}

class GitVariables {
  final GitUser user;
  final GitCommit previousCommit;
  final String latestShaIdentifier;
  final String originUrl;
  final BigInt projectShaIdentifier;

  const GitVariables({
    required this.user,
    required this.originUrl,
    required this.projectShaIdentifier,
    required this.latestShaIdentifier,
    required this.previousCommit,
  });
}
