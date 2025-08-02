import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<String> getProjectOriginUrl({
  required String directoryPath,
}) async {
  final resultAsync = await runBabelProcess(
    command: 'git remote get-url origin',
    dirrPath: directoryPath,
  );

  return resultAsync.fold((result) {
    if (result.exitCode != 0) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Git remote URL not found',
          description:
              'Could not get remote URL for this repository. '
              'Please ensure your Git repository has a remote origin configured. '
              'Run "git remote add origin <repository-url>" to add a remote. '
              'Error: ${result.stderr}',
        ),
      ).toFailure();
    }

    return result.stdout.toString().trim().toSuccess();
  }, (failure) => Failure(failure));
}

AsyncBabelResult<CreateFlowGotProjectOriginUrl> create_getProjectOriginUrl(
  CreateFlowGotLastLocalCommit payload,
) async {
  final originUrlResult = await getProjectOriginUrl(
    directoryPath: payload.directoryPath,
  );

  return originUrlResult.flatMap((originUrl) {
    return CreateFlowGotProjectOriginUrl(
      willLog: payload.willLog,
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

AsyncBabelResult<SyncFlowGotProjectOriginUrl> sync_getProjectOriginUrl(
  SyncFlowGotLastLocalCommit payload,
) async {
  final originUrlResult = await getProjectOriginUrl(
    directoryPath: payload.directoryPath,
  );

  return originUrlResult.flatMap((originUrl) {
    return SyncFlowGotProjectOriginUrl(
      willLog: payload.willLog,
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

AsyncBabelResult<GenerateFlowGotProjectOriginUrl> generate_getProjectOriginUrl(
  GenerateFlowGotLastLocalCommit payload,
) async {
  final originUrlResult = await getProjectOriginUrl(
    directoryPath: payload.directoryPath,
  );

  return originUrlResult.flatMap((originUrl) {
    return GenerateFlowGotProjectOriginUrl(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
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
