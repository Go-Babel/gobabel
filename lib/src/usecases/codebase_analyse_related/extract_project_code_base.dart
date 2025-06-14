import 'dart:io';

import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Set<ContextPath>> extractProjectCodeBase({
  required String dirrPath,
}) async {
  try {
    final libDir = Directory('$dirrPath/lib');
    final target = await buildFolderTree(libDir);
    if (target == null) {
      throw Exception('Target directory not found');
    }

    return target.listAllFolders().toSuccess();
  } catch (e, s) {
    return Exception('Error extracting project code base: $e\n$s').toFailure();
  }
}

AsyncResult<CreateFlowExtractedProjectCodebase> create_extractProjectCodeBase(
  CreateFlowGotGitVariables payload,
) async {
  final dirrPath = payload.directoryPath;
  final codeBaseResult = await extractProjectCodeBase(dirrPath: dirrPath);

  return codeBaseResult.flatMap((codeBase) {
    return CreateFlowExtractedProjectCodebase(
      yamlInfo: payload.yamlInfo,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      gitVariables: payload.gitVariables,
      contextPaths: codeBase,
    ).toSuccess();
  });
}

AsyncResult<SyncFlowExtractedProjectCodebase> sync_extractProjectCodeBase(
  SyncFlowGotGitVariables payload,
) async {
  final dirrPath = payload.directoryPath;
  final codeBaseResult = await extractProjectCodeBase(dirrPath: dirrPath);

  return codeBaseResult.flatMap((codeBase) {
    return SyncFlowExtractedProjectCodebase(
      yamlInfo: payload.yamlInfo,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      gitVariables: payload.gitVariables,
      contextPaths: codeBase,
    ).toSuccess();
  });
}
