import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<String> getProjectOriginUrl({required String directoryPath}) async {
  try {
    final result = await BabelProcessRunner.run(
      command: 'git remote get-url origin',
      dirrPath: directoryPath,
    );

    if (result.exitCode != 0) {
      return BabelException(
        title: 'Git remote URL not found',
        description: 'Could not get remote URL for this repository. '
            'Please ensure your Git repository has a remote origin configured. '
            'Run "git remote add origin <repository-url>" to add a remote. '
            'Error: ${result.stderr}',
      ).toFailure();
    }

    return result.stdout.toString().trim().toSuccess();
  } catch (e) {
    return BabelException(
      title: 'Git host detection error',
      description: 'Failed to detect Git host for the repository. '
          'Please ensure Git is installed and the repository is properly initialized. '
          'Error details: $e',
    ).toFailure();
  }
}

AsyncResult<CreateFlowGotProjectOriginUrl> create_getProjectOriginUrl(
  CreateFlowGotLastLocalCommit payload,
) async {
  final originUrlResult = await getProjectOriginUrl(
    directoryPath: payload.directoryPath,
  );

  return originUrlResult.flatMap((originUrl) {
    return CreateFlowGotProjectOriginUrl(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitUser: payload.gitUser,
      previousCommit: payload.previousCommit,
      projectOriginUrl: originUrl,
    ).toSuccess();
  });
}

AsyncResult<SyncFlowGotProjectOriginUrl> sync_getProjectOriginUrl(
  SyncFlowGotLastLocalCommit payload,
) async {
  final originUrlResult = await getProjectOriginUrl(
    directoryPath: payload.directoryPath,
  );

  return originUrlResult.flatMap((originUrl) {
    return SyncFlowGotProjectOriginUrl(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitUser: payload.gitUser,
      previousCommit: payload.previousCommit,
      projectOriginUrl: originUrl,
    ).toSuccess();
  });
}

AsyncResult<GenerateFlowGotProjectOriginUrl> generate_getProjectOriginUrl(
  GenerateFlowGotLastLocalCommit payload,
) async {
  final originUrlResult = await getProjectOriginUrl(
    directoryPath: payload.directoryPath,
  );

  return originUrlResult.flatMap((originUrl) {
    return GenerateFlowGotProjectOriginUrl(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitUser: payload.gitUser,
      previousCommit: payload.previousCommit,
      projectOriginUrl: originUrl,
    ).toSuccess();
  });
}
