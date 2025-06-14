import 'dart:io';

import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<GitVariables> getProjectGitDependencies({
  required String dirrPath,
  required GitCommit previousCommit,
  required GitUser user,
  required String originUrl,
}) async {
  try {
    // Run the command
    final ProcessResult result = await BabelProcessRunner.run(
      command: 'git rev-list --parents --reverse HEAD | head -2',
      dirrPath: dirrPath,
    );
    final shas = '${result.stdout}'.trim().split('\n');
    if (shas.length < 2) {
      return Exception(
        'Your project should have at least 2 commits.\nCommits SHA are used as a unique identifier of your project in gobabel system.\nAlso, check if you are in the correct path: $dirrPath',
      ).toFailure();
    }
    final projectShaIdentifierText = shas[1].trim().replaceAll(' ', '');
    final BigInt projectShaIdentifier = BigInt.parse(
      projectShaIdentifierText,
      radix: 16,
    );
    final latestShaIdentifier = shas[0].trim();
    return GitVariables(
      user: user,
      previousCommit: previousCommit,
      originUrl: originUrl,
      latestShaIdentifier: latestShaIdentifier,
      projectShaIdentifier: projectShaIdentifier,
    ).toSuccess();
  } catch (e, s) {
    return Exception(
      'Failed to get project dependencies. Please run create command if it\'s a new project. Double-check if your token key is valid and not misstyped.\n\nDETAILS:\n${'$e'.replaceAll('Exception: ', '')}\n$s',
    ).toFailure();
  }
}

AsyncResult<CreateFlowGotGitVariables> create_getProjectGitDependencies(
  CreateFlowGotProjectOriginUrl payload,
) async {
  final dirrPath = payload.directoryPath;
  final previousCommit = payload.previousCommit;
  final user = payload.gitUser;
  final originUrl = payload.projectOriginUrl;

  final gitVariablesResult = await getProjectGitDependencies(
    dirrPath: dirrPath,
    previousCommit: previousCommit,
    user: user,
    originUrl: originUrl,
  );

  return gitVariablesResult.flatMap((gitVariables) {
    return CreateFlowGotGitVariables(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitVariables: gitVariables,
    ).toSuccess();
  });
}
