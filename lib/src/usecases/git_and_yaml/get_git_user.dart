import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<GitUser> getGitUser({required String dirrPath}) async {
  try {
    final nameResult = await BabelProcessRunner.run(
      command: 'git config user.name',
      dirrPath: dirrPath,
    );
    final emailResult = await BabelProcessRunner.run(
      command: 'git config user.email',
      dirrPath: dirrPath,
    );

    final name = nameResult.stdout.toString().trim();
    final email = emailResult.stdout.toString().trim();

    return GitUser(authorName: name, authorEmail: email).toSuccess();
  } catch (e) {
    return Exception(
      'Failed to get git user information.\nPlease ensure you have Git installed and configured correctly.\nAlso, check if you are in the correct path: "$dirrPath"',
    ).toFailure();
  }
}

AsyncResult<CreateFlowGotGitUser> create_getGitUser(
  CreateFlowGotCodeBaseYaml payload,
) async {
  final dirrPath = payload.directoryPath;
  final gitUserResult = await getGitUser(dirrPath: dirrPath);

  return gitUserResult.flatMap((gitUser) {
    return CreateFlowGotGitUser(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      yamlInfo: payload.yamlInfo,
      client: payload.client,
      gitUser: gitUser,
    ).toSuccess();
  });
}
