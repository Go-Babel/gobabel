import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<GitUser> getGitUser({required String dirrPath}) async {
  final nameResultAsync = await runBabelProcess(
    command: 'git config user.name',
    dirrPath: dirrPath,
  );

  if (nameResultAsync.isError()) {
    return Failure(nameResultAsync.exceptionOrNull()!);
  }

  final nameResult = nameResultAsync.getOrNull()!;

  final emailResultAsync = await runBabelProcess(
    command: 'git config user.email',
    dirrPath: dirrPath,
  );

  if (emailResultAsync.isError()) {
    return Failure(emailResultAsync.exceptionOrNull()!);
  }

  final emailResult = emailResultAsync.getOrNull()!;

  final name = nameResult.stdout.toString().trim();
  final email = emailResult.stdout.toString().trim();

  return GitUser(authorName: name, authorEmail: email).toSuccess();
}

AsyncBabelResult<CreateFlowGotGitUser> create_getGitUser(
  CreateFlowGotCodeBaseYaml payload,
) async {
  final dirrPath = payload.directoryPath;
  final gitUserResult = await getGitUser(dirrPath: dirrPath);

  return gitUserResult.flatMap((gitUser) {
    return CreateFlowGotGitUser(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: gitUser,
    ).toSuccess();
  });
}

AsyncBabelResult<SyncFlowGotGitUser> sync_getGitUser(
  SyncFlowGotCodeBaseYaml payload,
) async {
  final dirrPath = payload.directoryPath;
  final gitUserResult = await getGitUser(dirrPath: dirrPath);

  return gitUserResult.flatMap((gitUser) {
    return SyncFlowGotGitUser(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: gitUser,
    ).toSuccess();
  });
}

AsyncBabelResult<GenerateFlowGotGitUser> generate_getGitUser(
  GenerateFlowGotCodeBaseYaml payload,
) async {
  final dirrPath = payload.directoryPath;
  final gitUserResult = await getGitUser(dirrPath: dirrPath);

  return gitUserResult.flatMap((gitUser) {
    return GenerateFlowGotGitUser(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: gitUser,
    ).toSuccess();
  });
}
