import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

/// Fetches Babel function declarations from the API
AsyncBabelResult<Set<BabelFunctionDeclaration>> extractBabelFunctionDeclarations({
  required ApiClientEntity client,
  required GitVariables gitVariables,
}) async {
  try {
    final declarationsMap = await client.server.publicProject.getProjectDeclarationFunctions(
      projectShaIdentifier: gitVariables.projectShaIdentifier,
    );
    
    // Convert Map<String, String> to Set<BabelFunctionDeclaration>
    // The map key is the function name, and the value is the function declaration
    final declarations = declarationsMap.values.toSet();
    
    return declarations.toSuccess();
  } catch (e) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to fetch Babel function declarations',
        description: 'Could not retrieve function declarations from server: ${e.toString()}',
      ),
    ).toFailure();
  }
}

AsyncBabelResult<SyncFlowExtractedBabelFunctionDeclarations>
sync_extractBabelFunctionDeclarations(
  SyncFlowExtractedProjectCodebase payload,
) async {
  final declarationsResult = await extractBabelFunctionDeclarations(
    client: payload.client,
    gitVariables: payload.gitVariables,
  );
  
  if (declarationsResult.isError()) {
    return declarationsResult.asBabelResultErrorAsync();
  }
  
  final declarations = declarationsResult.getOrThrow();
  
  return SyncFlowExtractedBabelFunctionDeclarations(
    willLog: payload.willLog,
    accountApiKey: payload.accountApiKey,
    directoryPath: payload.directoryPath,
    client: payload.client,
    yamlInfo: payload.yamlInfo,
    gitVariables: payload.gitVariables,
    contextPaths: payload.contextPaths,
    declarationFunctions: declarations,
  ).toSuccess();
}