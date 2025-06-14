import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<List<ShaCommit>> getProjectLastCommitShaStampsUsecase({
  required String projectApiToken,
  required GitVariables gitVariables,
  required Client client,
}) async {
  final shaUpdates = await client.publicProject.getLastShaKeys(
    projectApiToken: projectApiToken,
    projectShaIdentifier: gitVariables.projectShaIdentifier,
  );

  if (shaUpdates == null) {
    return Exception(
      'Failed to get project dependencies. Please run create command if it\'s a new project. Double-check if your token key is valid and not misstyped.',
    ).toFailure();
  }

  return shaUpdates.toSuccess();
}
