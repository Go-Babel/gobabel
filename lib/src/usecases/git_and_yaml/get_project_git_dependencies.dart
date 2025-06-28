import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<GitVariables> getProjectGitDependencies({
  required String dirrPath,
  required GitCommit previousCommit,
  required GitUser user,
  required String originUrl,
}) async {
  // Run the command
  final resultAsync = await runBabelProcess(
    command: 'git rev-list --parents --reverse HEAD | head -2',
    dirrPath: dirrPath,
  );
  
  return resultAsync.fold(
    (result) {
      try {
        final shas = '${result.stdout}'.trim().split('\n');
        if (shas.length < 2) {
          return BabelException(
            title: 'Insufficient Git history',
            description:
                'Your project should have at least 2 commits. '
                'Commit SHAs are used as unique identifiers in the GoBabel system. '
                'Please make at least 2 commits before running this command. '
                'Current path: $dirrPath',
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
      } catch (e) {
        return BabelException(
          title: 'Failed to get project dependencies',
          description:
              'Failed to retrieve Git project dependencies. '
              'If this is a new project, please run the create command first. '
              'Also verify that your API token is valid and correctly typed. '
              'Error details: ${e.toString().replaceAll('Exception: ', '')}',
        ).toFailure();
      }
    },
    (failure) => Failure(failure),
  );
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
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitVariables: gitVariables,
    ).toSuccess();
  });
}

AsyncResult<SyncFlowGotGitVariables> sync_getProjectGitDependencies(
  SyncFlowGotProjectOriginUrl payload,
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
    return SyncFlowGotGitVariables(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitVariables: gitVariables,
    ).toSuccess();
  });
}

AsyncResult<GenerateFlowGotGitVariables> generate_getProjectGitDependencies(
  GenerateFlowGotProjectOriginUrl payload,
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
    return GenerateFlowGotGitVariables(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitVariables: gitVariables,
    ).toSuccess();
  });
}
