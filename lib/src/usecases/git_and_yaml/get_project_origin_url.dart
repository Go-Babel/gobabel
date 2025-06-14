import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<String> getProjectOriginUrl({
  required String accountApiKey,
  required String directoryPath,
}) async {
  try {
    final result = await BabelProcessRunner.run(
      command: 'git remote get-url origin',
      dirrPath: directoryPath,
    );

    if (result.exitCode != 0) {
      return Exception(
        '❌ Could not get remote URL: ${result.stderr}',
      ).toFailure();
    }

    return result.stdout.toString().trim().toSuccess();
  } catch (e, s) {
    return Exception('⚠️ Error detecting Git host: $e\n\n$s').toFailure();
  }
}

AsyncResult<CreateFlowGotProjectOriginUrl> create_getProjectOriginUrl(
  CreateFlowGotLastLocalCommit payload,
) async {
  final originUrlResult = await getProjectOriginUrl(
    accountApiKey: payload.accountApiKey,
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
