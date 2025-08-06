import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

// Global variable for debug mode - set by CLI
bool _runLocally = false;

void setRunLocally(bool value) {
  _runLocally = value;
}

AsyncBabelResult<ApiClientEntity> createClientEntity(Directory dir) async {
  const localUrl = 'http://localhost:8080/';
  const prodUrl = 'https://gobabel.api.serverpod.space/';
  final url = _runLocally ? localUrl : prodUrl;
  final client = ApiClientEntity(
    host: url,
    connectionTimeout: const Duration(minutes: 10),
  );

  final containsLib = await Directory('${dir.path}lib').exists();
  if (containsLib == false) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Invalid Directory Location',
        description:
            'The provided directory must be inside a "lib" folder of your Dart/Flutter project. GoBabel needs to operate within the lib directory to properly analyze and manage your codebase. Please run the command from within your project\'s lib directory or provide a path to a directory inside lib.',
      ),
    ).toFailure();
  }

  return client.toSuccess();
}

AsyncBabelResult<CreateFlowCreatedClient> create_createClientEntity(
  CreateFlowInitial payload,
) {
  return createClientEntity(payload.directory).flatMap((client) {
    return CreateFlowCreatedClient(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: client,
    ).toSuccess();
  });
}

AsyncBabelResult<SyncFlowCreatedClient> sync_createClientEntity(
  SyncFlowInitial payload,
) {
  return createClientEntity(payload.directory).flatMap((client) {
    return SyncFlowCreatedClient(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: client,
    ).toSuccess();
  });
}

AsyncBabelResult<GenerateFlowCreatedClient> generate_createClientEntity(
  GenerateFlowInitial payload,
) {
  return createClientEntity(payload.directory).flatMap((client) {
    return GenerateFlowCreatedClient(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      client: client,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
      runForAllFiles: payload.runForAllFiles,
    ).toSuccess();
  });
}
