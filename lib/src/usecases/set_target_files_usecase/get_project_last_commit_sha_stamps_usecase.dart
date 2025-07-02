import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<List<ShaCommit>> getProjectLastCommitShaStampsUsecase({
  required String projectApiToken,
  required GitVariables gitVariables,
  required Client client,
}) async {
  final shaUpdates = await client.publicProject.getLastShaKeys(
    projectApiToken: projectApiToken,
    projectShaIdentifier: gitVariables.projectShaIdentifier,
  );

  if (shaUpdates == null) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to get project commit history',
        description:
            'Unable to retrieve project commit stamps from the GoBabel service.\n\nPossible causes:\n• This is a new project - please run the create command first\n• Your API token is invalid or mistyped\n• Network connectivity issues\n\nPlease verify your project API token and try again.',
      ),
    ).toFailure();
  }

  return shaUpdates.toSuccess();
}
