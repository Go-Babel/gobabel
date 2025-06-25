import 'dart:io';

import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Set<ContextPath>> extractProjectCodeBase({
  required String dirrPath,
}) async {
  try {
    final libDir = Directory('$dirrPath/lib');
    final target = await buildFolderTree(libDir);
    if (target == null) {
      return BabelException(
        title: 'Target Directory Not Found',
        description: 'Could not find the lib directory at path: $dirrPath/lib\n\n'
            'Please ensure:\n'
            '• You are running this command from the project root\n'
            '• The project has a "lib" directory\n'
            '• The directory path is correct\n\n'
            'Expected directory structure:\n'
            '$dirrPath/\n'
            '└── lib/\n'
            '    └── src/\n'
            '        └── ...',
      ).toFailure();
    }

    return target.listAllFolders().toSuccess();
  } catch (e, s) {
    return BabelException(
      title: 'Code Base Extraction Failed',
      description: 'Failed to extract project code base structure.\n\n'
          'Error: $e\n\n'
          'Stack trace: $s\n\n'
          'This may occur when:\n'
          '• The project structure is corrupted\n'
          '• File system permissions are insufficient\n'
          '• Symbolic links create circular references\n'
          '• The lib directory contains invalid file names\n\n'
          'Directory being analyzed: $dirrPath',
    ).toFailure();
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

AsyncResult<GenerateFlowExtractedCodeBase> generate_extractProjectCodeBase(
  GenerateFlowAddedSharedPrefsInFlutterProjects payload,
) async {
  final dirrPath = payload.directoryPath;
  final codeBaseResult = await extractProjectCodeBase(dirrPath: dirrPath);

  return codeBaseResult.flatMap((codeBase) {
    return GenerateFlowExtractedCodeBase(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      downloadLink: payload.downloadLink,
      referenceArbMap: payload.referenceArbMap,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: payload.filesVerificationState,
      projectArbData: payload.projectArbData,
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      remapedArbKeys: payload.remapedArbKeys,
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
      contextPaths: codeBase,
    ).toSuccess();
  });
}
